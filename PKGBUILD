# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=konfig
pkgver=4.19.292
pkgrel=1
pkgdesc="Manager for Linn DS players on the network"
arch=('x86_64')
url="http://oss.linn.co.uk/trac/wiki/Konfig"
license=('BSD')
depends=('mono' 'gtk-sharp-2' 'webkit-sharp')
source=("http://oss.linn.co.uk/Releases/Konfig/Davaar/${pkgname}_latest_amd64.deb"
		'konfig.patch')
md5sums=('38948c43da374e938a629e5c93861105'
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
