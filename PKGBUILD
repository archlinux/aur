pkgname=python-soundfile
pkgver=0.10.1
pkgrel=1
pkgdesc="An audio library based on libsndfile, CFFI and NumPy"
url="https://github.com/bastibe/PySoundFile"
arch=('any')
license=('BSD')
makedepends=('python-setuptools')
depends=('python-cffi' 'libsndfile' 'python-numpy')
source=("https://github.com/bastibe/PySoundFile/archive/${pkgver}.tar.gz")
sha256sums=('f53fc58b943827fee60e40ee87c11d1ff21cf6567c65449897371a4019be8c28')

build() {
  cd "${srcdir}"/SoundFile-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/SoundFile-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


