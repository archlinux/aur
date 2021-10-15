# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=pulsemeeter-git
_pkgname=pulsemeeter
pkgver=1.0.r20.eae3def
pkgrel=1
pkgdesc="A pulseaudio audio routing application"
url="https://github.com/theRealCarneiro/pulsemeeter"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python-gobject' 'gtk3')
provides=('pulsemeeter')
makedepends=('git' 'imagemagick' 'make')
optdepends=('glade: customize interface')
source=(${_pkgname}::git+${url}.git)
md5sums=('SKIP')

pkgver(){
	cd $_pkgname
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd $_pkgname
	make DESTDIR=$pkgdir PREFIX=/usr install
}

