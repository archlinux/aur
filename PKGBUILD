pkgname=gdmap-gtk3
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool to inspect the used space of folders."
arch=('x86_64')
url="https://gitlab.com/sjohannes/gdmap"
license=('GPL')
depends=('gtk3')
makedepends=('gettext' 'intltool')
conflicts=('gdmap')
source=("https://gitlab.com/sjohannes/gdmap/-/archive/v${pkgver}/gdmap-v${pkgver}.tar.gz")
md5sums=('679d5664845563a0a1450c393ca4cfe5')

build() {
  meson --prefix=/usr --buildtype=plain "./gdmap-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
