# Maintainer: jeremija <jerko.steiner+aur@gmail.com>
pkgname=wl-gammarelay
pkgver=0.1.0
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
  https://github.com/jeremija/wl-gammarelay/archive/refs/tags/v$pkgver.tar.gz
)
noextract=()
 #generate with 'makepkg -g'
md5sums=('ca2d2f1622f54b56a1ca33f29f35ae21')

build() {
  make -C "$srcdir/$pkgname-$pkgver" VERSION=v$pkgver COMMIT_HASH=""
}

package() {
  mkdir -p $pkgdir/usr/bin
  make -C "$srcdir/$pkgname-$pkgver" PREFIX=$pkgdir/usr install
}
