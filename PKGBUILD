# Contributor: Idares <idares@seznam.cz>

pkgname=nagios-plugins
pkgver=1.4.11
pkgrel=1
pkgdesc="Plugins are scripts and programs that perform host and service checks."
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.nagios.org"
source=("http://downloads.sourceforge.net/nagiosplug/$pkgname-$pkgver.tar.gz")
md5sums=('042783a2180a6987e0b403870b3d01f7')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr/share/nagios || return 1
	make || return 1
	make prefix=$startdir/pkg/usr/share/nagios install install-root || return 1
}

