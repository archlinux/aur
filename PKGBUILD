# Maintainer: jeremija <jerko.steiner+aur@gmail.com>
pkgname=wl-gammarelay
pkgver=0.1.3
pkgrel=1
pkgdesc="A client and daemon for changing color temperature and brightness under Wayland via keybindings."
arch=('x86_64')
url="https://github.com/jeremija/wl-gammarelay"
license=('GPL3')
groups=()
depends=(
  'wayland'
)
makedepends=(
  'go'
)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/jeremija/wl-gammarelay/archive/refs/tags/v$pkgver.tar.gz
)
noextract=()
 #generate with 'makepkg -g'
md5sums=('4896ee217625e345fcae252aac7e7be5')

build() {
  make -C "$srcdir/$pkgname-$pkgver" VERSION=v$pkgver COMMIT_HASH=""
}

package() {
  mkdir -p $pkgdir/usr/bin
  make -C "$srcdir/$pkgname-$pkgver" PREFIX=$pkgdir/usr install
}
