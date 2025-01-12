# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tty-share"
pkgname="${_pkgname}-bin"
pkgver=2.4.1
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
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64")
source_i686=("${_pkgsrc}-i686::${_url}/releases/download/v${pkgver}/${_pkgname}_linux-386")
sha256sums=('bcdaf5343bee838bd4210d48fc95ea02b4067ecae7ba97620b3dfbec07891f78'
            '29758dfaac84d3a8de50b2fd9c1b73ac2e58197035b9df5ccc1f5f67e01a8ab0')
sha256sums_x86_64=('c7987be35ae16e173dd56727f1f7cce8fc5da6da36be6c938b6e1a525d5698d2')
sha256sums_i686=('d9041d1a1138799a1680a9191579a1f248d12382f46b3c7f0eb24742c4da6fba')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
