# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

pkgname=swaykbdd
pkgver=1.4
pkgrel=1
pkgdesc='Automatic keyboard layout switching in Sway'
arch=('x86_64')
license=('MIT')
makedepends=('meson')
depends=('json-c')
url='https://github.com/artemsen/swaykbdd'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('ab2ed5d8037555a23e9378bddc568710')

build() {
  arch-meson ${pkgname}-${pkgver} build
  meson compile -C build
}

package(){
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
