# Maintainer: hakaishi

pkgname=qshutdown
pkgver=1.7.1
pkgrel=1
pkgdesc="Shutdown your computer"
arch=('x86_64')
url="https://launchpad.net/~hakaishi/+archive/ubuntu/qshutdown"
license=('custom')
depends=('qt5-tools' 'qt5-quick1' 'qt5-websockets' 'qt5-svg' 'gstreamer0.10-base' 'libxss' 'qt5-imageformats') 
source=("http://ppa.launchpad.net/hakaishi/qshutdown/ubuntu/pool/main/q/qshutdown/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('418249014ef3ec46a38b10b183408a86')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	qmake 
	make -j4
	}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
	}
