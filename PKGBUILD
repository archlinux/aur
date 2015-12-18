# Maintainer: Bernhard Landauer <oberon at manjaro dot org>
# Contributor: Gernot Pansy <gernot.pansy@ut11.net>

pkgname=mysms
pkgver=2.0
pkgrel=1
pkgdesc="Text anywhere, anytime and on any device"
url="http://download.opensuse.org/repositories/home:/mysms/Debian_7.0"
arch=('x86_64' 'i686')
license=('LGPL-2.1+' 'BSD-C3')
depends=('gcc'
	'libstdc++296'
	'qtwebkit'
	'phonon-qt4'
	'qt4')

if [ "$CARCH" = "x86_64" ]; then
  source=("$url/amd64/mysms_2.0-1_amd64.deb")
md5sums=('7d1e0d6c216dcc0c6f3f9f4ce1cf64b3')
else
  source=("$url/i386/mysms_2.0-1_i386.deb")
fi
package() {
	tar -xvzf data.tar.gz
	install -Dm755 usr/bin/$pkgname $pkgdir/usr/bin/$pkgname
	cp -r usr/* $pkgdir/usr
}
