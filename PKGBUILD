# Maintainer: Filip Parag <filip@parag.rs>

pkgname=wmrc
pkgver=2.1.0
pkgrel=1
pkgdesc='Simple modular window manager extensions'
arch=('any')
url='https://github.com/filiparag/wmrc'
license=('MIT')
depends=('coreutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('14b2c898dfec32494f6d7092a8384ec51dc55f1032b7748df3ca0ee4016e7e89')

package() {
  cd "${pkgname}-${pkgver}" || return 1
  install -Dm 775 "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 664 "./lib${pkgname}.sh" "${pkgdir}/usr/share/${pkgname}/libwmrc.sh"
  install -Dm 644 "./${pkgname}.man" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  sed -i "s/^WMRC_DIR=.*$/WMRC_DIR=\/usr\/share\/${pkgname}/" "${pkgdir}/usr/bin/${pkgname}"
}
