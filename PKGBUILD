# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=smplayer-themes-svn
pkgver=14.12.0.r6889
pkgrel=1
pkgdesc="Themes for SMPlayer"
arch=('any')
url="http://smplayer.sourceforge.net/"
license=('GPL')
depends=('smplayer')
makedepends=('subversion')
provides=('smplayer-themes')
conflicts=('smplayer-themes')
source=("$pkgname::svn+https://subversion.assembla.com/svn/smplayer/smplayer-themes/trunk/")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(grep -m1 'version' smplayer-themes.spec | cut -d " " -f3).r$(svnversion)
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make PREFIX="$pkgdir/usr" install
}

