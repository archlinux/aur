# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=oliver
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple GUI for PHPStan"
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~fabrixxm/oliver"
license=(GPL3)
depends=('gtk4' 'libadwaita' 'php')
makedepends=('vala' 'meson' 'ninja' 'blueprint-compiler' 'gobject-introspection' 'git')
provides=(oliver)
source=("https://git.sr.ht/~fabrixxm/oliver/archive/$pkgver.tar.gz")
md5sums=('d970198e17739d996728f8399f23a4fc')


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
