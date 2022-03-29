# Maintainer: hakaishi

pkgname=qshutdown
rc_value=~rc8
pkgver=1.8.0.0${rc_value}
pkgrel=1
pkgdesc="Shutdown your computer"
arch=('x86_64')
url="https://launchpad.net/~hakaishi/+archive/ubuntu/qshutdown"
license=('custom')
depends=('qt5-tools' 'qt5-base') 
source=("http://ppa.launchpad.net/hakaishi/qshutdown/ubuntu/pool/main/q/qshutdown/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('9a1ab4019361563ca9caac483a62db6b')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	qmake 
	make -j4
	}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
	}
