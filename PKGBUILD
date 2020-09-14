pkgname=alsa-control
pkgver=0.1.0
pkgrel=1
pkgdesc="Easy to use ALSA default soundcard and volume configurator using Dmix and Softvol"
arch=('any')
url="https://github.com/sezanzeb/alsa-control/"
license=('GPL3')
depends=('python-gobject' 'python-pyalsaaudio')
makedepends=('git' 'python-distutils-extra')
provides=('alsa-control')
conflicts=('alsa-control')
source=("git+https://github.com/sezanzeb/alsa-control.git")
md5sums=('SKIP')
_gitname="alsa-control"

pkgver() {
	cd "$srcdir"/"$_gitname"
	git describe --tags | sed 's/-/+/g'
}

build() {
	cd "$srcdir"/"$_gitname"
	python3 setup.py build
}

package() {
	cd "$srcdir"/"$_gitname"
	python3 setup.py install --root=$pkgdir
}

