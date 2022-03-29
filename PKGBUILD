# Maintainer: hakaishi

pkgname=qshutdown-git
_pkgname=qshutdown
pkgpref=shutdown-qapps
pkgver=1.8.0
pkgrel=2
pkgdesc="Shutdown your computer"
arch=('x86_64')
url="https://launchpad.net/~hakaishi/+archive/ubuntu/qshutdown"
license=('custom')
conflicts=('qshutdown')
depends=('qt5-tools' 'qt5-base') 
source=("git+https://github.com/hakaishi/shutdown-qapps.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgpref/${_pkgname}"

	qmake 
	make -j4
	}

package() {
	cd "$srcdir/$pkgpref/${_pkgname}"
	make INSTALL_ROOT="$pkgdir" install
	}
