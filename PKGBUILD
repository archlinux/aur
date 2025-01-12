# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tty-share"
pkgname="${_pkgname}-bin"
pkgver=2.4.1
pkgrel=2
pkgdesc="Share your terminal over the Internet"
arch=('x86_64' 'i686')
url="https://tty-share.com"
_url="https://github.com/elisescu/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64")
source_i686=("${_pkgsrc}-i686::${_url}/releases/download/v${pkgver}/${_pkgname}_linux-386")
sha256sums=('bcdaf5343bee838bd4210d48fc95ea02b4067ecae7ba97620b3dfbec07891f78'
            '29758dfaac84d3a8de50b2fd9c1b73ac2e58197035b9df5ccc1f5f67e01a8ab0')
sha256sums_x86_64=('6475cfaaf704837f1b85b9967804ec6483ca3e3745e8b4620c2b7ed40453273f')
sha256sums_i686=('b3fbc89b6073b54776ac31bfed5fcd7146b7953fa2cac81de5994a8897c89597')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
