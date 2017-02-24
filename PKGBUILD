# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer: Felice Murolo <linuxboy@fel.hopto.org>
pkgname=kencfs
pkgver=1.6.4
pkgrel=3
#epoch=
pkgdesc="GUI frontend for encfs. Create, mount, umount and delete your encrypted fs."
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/p/1127802/"
license=('(L)GPL')
#groups=()
depends=('encfs>=1.7.4-8' 'fuse>=2.9.2-1' 'kdelibs')
#makedepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('067c979aab2960dc6604c47906e56115')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt4
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make DESTDIR="$pkgdir/" install
  make INSTALL_ROOT=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:

