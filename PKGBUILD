# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

pkgname=swaykbdd
pkgver=1.3
pkgrel=1
pkgdesc='Automatic keyboard layout switching in Sway'
arch=('x86_64')
license=('MIT')
makedepends=('meson')
depends=('json-c')
url='https://github.com/artemsen/swaykbdd'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('631ec73cec365e6a7b24c0a16cab9585')

build() {
  arch-meson ${pkgname}-${pkgver} build
  meson compile -C build
}

package(){
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
