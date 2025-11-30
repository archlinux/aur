pkgname=ultimate-tic-tac-toe-git
pkgver=1.1.0
pkgrel=1
pkgdesc="Ultimate Tic Tac Toe - GTK4/libadwaita Python game"
arch=('x86_64' 'aarch64')
url="https://github.com/Nokse22/ultimate-tic-tac-toe"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
makedepends=('meson' 'ninja' 'pkgconf' 'python-setuptools' 'python-pip')
provides=('ultimate-tic-tac-toe')
source=("https://github.com/Nokse22/ultimate-tic-tac-toe/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson setup build --prefix=/usr --localstatedir=/var --buildtype=release
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
