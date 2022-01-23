# Maintainer: jeremija <jerko.steiner+aur@gmail.com>
pkgname=wl-gammarelay
pkgver=0.0.6
pkgrel=1
pkgdesc=""
arch=('x86_64')
url=""
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
md5sums=(
  '7ae50fd272ccb0436961e777ac49192d'
) #generate with 'makepkg -g'

build() {
  make -C "$srcdir/$pkgname-$pkgver" VERSION=v$pkgver COMMIT_HASH=""
}

package() {
  mkdir -p $pkgdir/usr/bin
  make -C "$srcdir/$pkgname-$pkgver" PREFIX=$pkgdir/usr install
}
