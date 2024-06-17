# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=oliver
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple GUI for PHPStan"
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~fabrixxm/oliver"
license=(GPL3)
depends=('gtk4' 'libadwaita' 'php')
makedepends=('vala' 'meson' 'ninja' 'blueprint-compiler' 'gobject-introspection' 'git')
provides=(oliver)
source=("https://git.sr.ht/~fabrixxm/oliver/archive/$pkgver.tar.gz")
md5sums=('2a8c5c5f508cee6fc594b10ae5237b88')


build() {
  arch-meson build "$pkgname-$pkgver"
  ninja -C build
}

check() {
  cd "${srcdir}/build"
  # ninja test
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" ninja install
}
