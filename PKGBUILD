# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>

pkgname=matchbox-window-manager
pkgver=1.2
pkgrel=4
pkgdesc="A pretty much unique X window manager with a classic PDA management policy"
arch=('x86_64')
license=('GPL')
depends=('libmatchbox' 'startup-notification' 'libpng' 'libsm')
url="http://matchbox-project.org/"
source=(https://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('81a23a4af797cf350759fd5ac738797015a66dd5dba2f3d9f3c6908506c1ceff')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr \
	--enable-startup-notification --enable-session \
	--enable-alt-input-wins --enable-expat
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
