# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=confy
pkgver=0.6.5
pkgrel=1
pkgdesc="Conferences schedule viewer for GNOME"
arch=('x86_64' 'aarch64')
url="https://confy.kirgroup.net/"
license=(GPL3)
depends=('python' 'gtk3' 'libhandy' 'python-gobject' 'python-icalendar' 'libnotify')
makedepends=('meson' 'ninja' 'gobject-introspection' 'git')
provides=(confy)
source=("https://git.sr.ht/~fabrixxm/confy/archive/$pkgver.tar.gz")
md5sums=('317d9d50c1ba1577cce8d0b4c9fff9ec')


build() {
  arch-meson build "$pkgname-$pkgver"
  ninja -C build
}

check() {
  cd "${srcdir}/build"
  ninja test
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" ninja install
}
