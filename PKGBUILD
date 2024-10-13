# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tty-share"
pkgname="${_pkgname}-bin"
pkgver=2.4.0
pkgrel=1
pkgdesc="Share your terminal over the Internet"
arch=('x86_64' 'i686')
url="https://tty-share.com"
_url="https://github.com/elisescu/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64")
source_i686=("${_pkgsrc}-i686::${_url}/releases/download/v${pkgver}/${_pkgname}_linux-386")
sha256sums=('5d55ba252d9faa9983857285cb524b403927cd212e2f1e58cb3ee55b46b3a465'
            '29758dfaac84d3a8de50b2fd9c1b73ac2e58197035b9df5ccc1f5f67e01a8ab0')
sha256sums_x86_64=('7c26894c13ad1a066382f2d8e6812d3a25f4bf6b595e369e0f1b70e09d7883d9')
sha256sums_i686=('e5a0033f48290823c5872a780846184decc7076e1f2e6c16689be7cb08324a58')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
