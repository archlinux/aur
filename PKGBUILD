# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgexec=mpm
_pkgauthor=kdeldycke
_pkgname=meta-package-manager
pkgname=${_pkgname}-bin
pkgver=5.18.0
pkgrel=1
pkgdesc='A wrapper around all package managers'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('GPL2')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/license"
        "README-${pkgver}.md::${_urlraw}/readme.md")
source_x86_64=("${_pkgexec}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgexec}-linux-x64.bin")
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            '841e74dee1776feb02f77cee402659ebc636ebaf685c98219276e530b37ba9da')
sha256sums_x86_64=('188475b1dc7c2ba3edbf5886f2256ee3fe4af2ac9bfc178d07b61d399b088c51')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
