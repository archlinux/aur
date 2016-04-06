# Maintainer: Tim Langlois <trl54@cornell.edu>

basename=wavefile
pkgname=python-${basename}
pkgver=1.5
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="Pythonic libsndfile wrapper to read and write audio files."
url="https://github.com/vokimon/python-wavefile"
makedepends=('python-setuptools')
depends=('python-numpy')
optdepends=('python-pyaudio')
source=("https://pypi.python.org/packages/source/w/wavefile/wavefile-${pkgver}.tar.gz")
md5sums=('b5d71713b4fded3c9350cbf61a51a9a1')

build() {
    cd "${srcdir}/${basename}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${basename}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
