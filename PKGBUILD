# Maintainer: aksr <aksr at t-com dot me>
pkgname=akemi-git
pkgver=r40.7d166b7
pkgrel=1
epoch=
pkgdesc="The cutest X windows manipulation tool around!"
arch=('i686' 'x86_64')
url="https://github.com/6c37/akemi"
license=('BSD')
groups=()
depends=('libxcb' 'fuse')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/6c37/akemi")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

