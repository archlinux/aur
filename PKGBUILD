# Maintainer: Tim Langlois <trl54@cornell.edu>

basename=wavefile
pkgname=python-${basename}
pkgver=1.4
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="Pythonic libsndfile wrapper to read and write audio files."
url="https://github.com/vokimon/python-wavefile"
makedepends=('python-setuptools')
depends=('python-numpy')
optdepends=('python-pyaudio')
source=("https://pypi.python.org/packages/source/w/wavefile/wavefile-1.4.tar.gz")
md5sums=('4427a9a24536bf759e9e791d4424c6b4')

build() {
    cd "${srcdir}/${basename}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${basename}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
