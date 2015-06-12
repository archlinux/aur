# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=smplayer-skins-svn
pkgver=15.2.0.r6889
pkgrel=1
pkgdesc="Skins for SMPlayer"
arch=('any')
url="http://smplayer.sourceforge.net/"
license=('GPL')
depends=('smplayer')
makedepends=('subversion')
provides=('smplayer-skins')
conflicts=('smplayer-skins')
source=("$pkgname::svn+https://subversion.assembla.com/svn/smplayer/smplayer-skins/trunk/")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(grep -m1 'version' smplayer-skins.spec | cut -d " " -f3).r$(svnversion)
}

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

