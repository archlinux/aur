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
sha256sums=('9d40d14439b6b99956f3eca6f34f0368cc7b2e24f8125934b414b6d1d4f358c8')

build() {
  meson --prefix=/usr --buildtype=plain "./gdmap-v${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
