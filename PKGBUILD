#  Maintainer: hrocho <hrocho at vodacionline dot sk>
pkgname=brlcad-bin
pkgver=7.24.2
pkgrel=0
pkgdesc="An extensive 3D solid modeling system."
url="http://brlcad.org"
license=('LGPL' 'BSD' 'custom:BDL')
arch=('i686' 'x86_64')
# install=$pkgname.install
makedepends=('bc' 'cmake' 'libxslt')
depends=('rpmextract' 'boost' 'flex' 'libgl' 'libpng' 'mesa' 'tk' 'zlib')



if [ "$CARCH" = "i686" ]; then
	source=(http://downloads.sourceforge.net/project/brlcad/BRL-CAD%20for%20Linux/$pkgver/brlcad-$pkgver-0.fedora.i386.rpm)
	md5sums=('d253872b95c92869ef0ab0f4ffd24e58')
elif [ "$CARCH" = "x86_64" ]; then
	    source=(http://downloads.sourceforge.net/project/brlcad/BRL-CAD%20for%20Linux/$pkgver/brlcad-$pkgver-0.fedora.x86_64.rpm)
		md5sums=('408f38cfe8ae9d336c140c7aa35fcc65')
fi


build() {
	rpmextract.sh brlcad-$pkgver-0.fedora.x86_64.rpm 
}

package() {
	cd ${srcdir}/
	mv {etc,usr} ${pkgdir}
}
