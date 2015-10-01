# Contributor: Tim Langlois <trl54@cornell.edu>
# Maintainer: Sebastian Wolf <swolf at melonkru dot de>
basename=wavefile
pkgname=python2-${basename}
pkgver=1.4
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="Pythonic libsndfile wrapper to read and write audio files. For Python2."
url="https://github.com/vokimon/python-wavefile"
makedepends=('python2-setuptools')
depends=('python2-numpy')
optdepends=('python2-pyaudio')
source=("https://pypi.python.org/packages/source/w/${basename}/${basename}-${pkgver}.tar.gz")
md5sums=('4427a9a24536bf759e9e791d4424c6b4')

build() {
    cd "${srcdir}/${basename}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${basename}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
