# Maintainer: max-k <max-k AT post DOT com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: kezar <kezar@inbox.com>

pkgname=antileech
_gitname=amule-dlp.antiLeech
pkgver=10.c526f61
pkgrel=1
pkgdesc="AntiLeech Library for aMule-dlp"
arch=('i686' 'x86_64')
url="https://github.com/persmule/amule-dlp"
license=('GPL')
depends=('amule-dlp')
source=("git+https://github.com/persmule/$_gitname")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install
}
