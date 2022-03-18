# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

pkgname=swaykbdd
pkgver=1.1
pkgrel=1
pkgdesc='Per-window keyboard layouts for Sway (KBDD replacement)'
arch=('x86_64')
license=('MIT')
makedepends=('meson')
depends=('json-c')
url='https://github.com/artemsen/swaykbdd'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('eaf8771ae0ddac09c0e89bdfd895ce85')

build() {
  arch-meson ${pkgname}-${pkgver} build
  meson compile -C build
}

package(){
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
