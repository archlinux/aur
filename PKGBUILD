pkgname=guile-dbd-sqlite3-git
pkgrel=1
pkgver=19
pkgdesc='guile-dbi database driver for sqlite version 3'
arch=(any)
license=(gpl3)
makedepends=(git)
depends=(guile guile-dbi sqlite3)
source=("$pkgname::git://github.com/jkalbhenn/guile-dbd-sqlite3")
url=https://github.com/jkalbhenn/guile-dbd-sqlite3
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}

build() {
  cd $pkgname
  chmod +x configure
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
}
