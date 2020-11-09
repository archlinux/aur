pkgname=alsa-control
pkgver=0.2.0
pkgrel=1
pkgdesc="Easy to use ALSA default soundcard and volume configurator using Dmix and Softvol"
arch=('any')
url="https://github.com/sezanzeb/alsa-control/"
license=('GPL3')
depends=('python-gobject' 'python-pyalsaaudio' 'python-numpy')
makedepends=('python-distutils-extra')
provides=('alsa-control')
conflicts=('alsa-control')
source=("https://github.com/sezanzeb/alsa-control/archive/${pkgver}.tar.gz")
md5sums=('SKIP')
_gitname="alsa-control"

build() {
	cd "${srcdir}/${_gitname}-${pkgver}"
	python3 setup.py build
}

package() {
	cd "${srcdir}/${_gitname}-${pkgver}"
	python3 setup.py install --root=$pkgdir
}

