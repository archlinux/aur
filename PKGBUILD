# Maintainer: robertfoster

pkgname=vhdl-simili
pkgver=3.1b16
pkgrel=5
pkgdesc="A low-cost VHDL development system designed for the serious hardware designer."
arch=('i686' 'x86_64')
url="http://www.symphonyeda.com/products.htm"
license=('custom')
source=(http://www.symphonyeda.com/Downloads/Simili31b16-linux-x86.tar
	$pkgname.sh
)
depends=('glibc' 'libx11')

if [[ "$CARCH" == 'x86_64' ]]; then
	depends=('lib32-'{'glibc','libx11'})
fi

package()
{
	similidir=opt/simili
	cd $srcdir
	install -dm755 $pkgdir/$similidir
	tar xvf Simili31b16-linux-x86-image.tgz -C $pkgdir/$similidir
	install -Dm755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/bin/$pkgname"

	# Fix for Documentation
	ln -sr /usr/bin/firefox $pkgdir/usr/bin/mozilla
}

md5sums=('b92b4bf72a55845576359f05d8465f12'
         '1c244349f72fe7abc1574b671dcde0c6')
