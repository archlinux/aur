# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=pulsemeeter
pkgver=1.2.6
pkgrel=1
pkgdesc="A pulseaudio audio routing application"
url="https://github.com/theRealCarneiro/pulsemeeter"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'python-gobject' 'python-appdirs' 'python-pulsectl' 'pulse-vumeter-git' 'gtk3' 'noise-suppression-for-voice' 'swh-plugins')
provides=('pulsemeeter')
makedepends=('git' 'python-setuptools')
optdepends=('glade: customize interface' 'pulseaudio' 'pipewire-pulse')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(da4b51c19725d4afa8be545472f4e460)

pkgver(){
	cd $pkgname-$pkgver
	printf "%s" $(python setup.py --version)
}

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
}
