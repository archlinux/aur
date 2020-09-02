pkgname=blanket-git
_pkgname=blanket
pkgver=0.2.0+8+gc0c6e24
pkgrel=1
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
url="https://github.com/rafaelmardojai/blanket"
arch=(x86_64)
license=(GPL2)
depends=('python' 'python-gobject' 'gtk3' 'libhandy' 'gstreamer')
makedepends=('meson')
provides=('blanket')
conflicts=('blanket')
source=("git+https://github.com/rafaelmardojai/blanket.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$_pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
