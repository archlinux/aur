# Author: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=mandelbulber2
pkgver=2.04
pkgrel=1
pkgdesc="3D application designed to render 3D fractals such as the Mandelbulb, Mandelbox, BulbBox, JuliaBulb, Menger Sponge, and Iterated Function Systems. Rewritten from scratch with new Qt based interface."
arch=('any')
url="http://www.mandelbulber.com/"
license=('GPL3')
depends=('libjpeg-turbo' 'qt5-tools' 'libpng12' 'gsl' 'openmpi')
source=('mandelbulber::http://downloads.sourceforge.net/project/mandelbulber/Mandelbulber%20v2/source%20-%20multiplatform/mandelbulber2-2.04.tar.gz?r=&ts=1438651548')
md5sums=('4f0d86a0f460ffa2f2a2a5a2072a977a')

build()
{ 
	cd "$srcdir/$pkgname-$pkgver/makefiles"
	qmake mandelbulber.pro
	make PREFIX=/usr all
}

package()
{
	cd "$srcdir/$pkgname-$pkgver/makefiles"
	make PREFIX=/usr install
}
