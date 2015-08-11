pkgname=guile-dbd-sqlite3-git
_gitname=guile-dbd-sqlite3
pkgrel=1
pkgver=19.16435ab
pkgdesc='guile-dbi database driver for sqlite version 3'
arch=(any)
license=(gpl3)
makedepends=(git)
depends=(guile guile-dbi sqlite3)
source=("git://github.com/jkalbhenn/$_gitname.git")
url=https://github.com/jkalbhenn/$_gitname
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  chmod +x configure
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir install
}
