# Maintainer: aksr <aksr at t-com dot me>
pkgname=retail-git
pkgver=r39.a4f54bb
pkgrel=1
epoch=
pkgdesc="tail with regular expressions"
arch=('i686' 'x86_64')
url="https://github.com/mwh/retail"
license=('GPLv3')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('retail')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/mwh/retail")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir/" PREFIX="usr" install
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}

