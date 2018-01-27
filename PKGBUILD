pkgname=toxygen-git
_pkgname=toxygen
pkgdesc="Toxygen is cross-platform Tox client written in Python3"
pkgrel=1
pkgver=0.4.1.0.640
arch=('i686' 'x86_64')
conflicts=("toxygen")
provides=("toxygen")
url="https://github.com/toxygen-project/toxygen"
license=('GPL-3.0')
depends=('python' 'toxcore' 'python-pyaudio' 'python-pyqt5' 'python-numpy' 'opencv')
source=('git://github.com/toxygen-project/toxygen.git')
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(python setup.py --version).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --prefix="$pkgdir/usr"
}
