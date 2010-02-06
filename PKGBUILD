# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=glom
pkgver=1.13.2
pkgrel=1
pkgdesc="An easy-to-use database designer and user interface"
arch=('i686' 'x86_64')
url="http://www.glom.org/"
license=('GPL')
depends=('libgdamm>=3.99.17' 'libxml++>=2.26.0' 'gconfmm>=2.28' 'pygtk' 'gnome-python-extras' 'libgtksourceviewmm2' 'goocanvasmm' 'libepc' 'iso-codes' 'postgresql' 'hicolor-icon-theme' 'shared-mime-info')
makedepends=('intltool' 'gnome-doc-utils>=0.18')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/glom/1.13/$pkgname-$pkgver.tar.bz2)
md5sums=('f9705a548675a5d9ae3f29b49d14e9e8')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr \
  	--with-postgres-utils=/usr/bin \
    	--disable-scrollkeeper \
	--disable-update-mime-database \
	--disable-static 
  make || return 1
  make DESTDIR=${pkgdir} install
}
