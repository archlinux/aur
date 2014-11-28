# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=pessulus
pkgver=2.30.2
pkgrel=5
pkgdesc="A lockdown editor for GNOME"
arch=('any')
url="http://live.gnome.org/Pessulus"
license=('GPL')
depends=('python2-bonobo' 'python2-gconf' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'gettext' 'intltool')
changelog=$pkgname.changelog
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/2.30/$pkgname-$pkgver.tar.gz)
sha256sums=('660611ce0bf34039ac2bbdc73f58d4098c4fc72a4b1301dba6004a43944e0871')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  export PYTHON=`which python2`
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  
  make DESTDIR=${pkgdir} install
}
