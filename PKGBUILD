# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=konfig
pkgver=4.18.220
pkgrel=1
pkgdesc="Manager for Linn DS players on the network"
arch=('x86_64')
url="http://oss.linn.co.uk/trac/wiki/Konfig"
license=('BSD')
depends=('mono' 'gtk-sharp-2' 'webkit-sharp')
source=("http://oss.linn.co.uk/Releases/Konfig/Davaar/${pkgname}_latest_amd64.deb"
		'konfig.patch')
md5sums=('86e6d1a8187762103d792e973a315c8e'
         '6c2f77714aad71c1a4475dea46463161')

build() {
	cd "$srcdir"
	tar xvzf data.tar.gz
	cd usr
	patch -p1 -i ${srcdir}/konfig.patch
}

package() {
	cd "$srcdir"
	cp -r usr $pkgdir
}
