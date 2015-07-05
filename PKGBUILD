# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kmailpt
pkgver=0.3
pkgrel=1
pkgdesc="KMail Power Tools"
arch=('i686' 'x86_64')
url="http://jice.free.fr/kmailpt/"
license=('GPL')
depends=('perl-mime-tools')
options=('!libtool')
#install=
#changelog=
source=(http://jice.free.fr/kmailpt/$pkgname-$pkgver.tar.bz2 Makefile)
#noextract=()
md5sums=('c8cff48f33223262d25440a0db01bd10' '23e464c03778228badb091c4dd6ffe73') #generate with 'makepkg -g'

build() {
  cp -f $srcdir/Makefile $srcdir/$pkgname-$pkgver/
  cd "$srcdir/$pkgname-$pkgver"
#  ./configure --prefix=/usr
#  make install
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
