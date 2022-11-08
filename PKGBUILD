pkgname=gdmap-gtk3
pkgver=1.2.0
pkgrel=1
pkgdesc="Tool to inspect the used space of folders."
arch=('x86_64')
url="https://gitlab.com/sjohannes/gdmap"
license=('GPL')
depends=('gtk3')
makedepends=('gettext' 'intltool' 'meson')
conflicts=('gdmap')
source=("https://gitlab.com/sjohannes/gdmap/-/archive/v${pkgver}/gdmap-v${pkgver}.tar.gz")
sha256sums=('48f9e2c6ffa1ae8801da019bb31817499732ff73c34bb64f54ca9e8db655beb6')

build() {
  meson --prefix=/usr --buildtype=plain "./gdmap-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
