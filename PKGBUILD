pkgname=python-sox
pkgver=1.3.7
pkgrel=1
pkgdesc="Python wrapper around SoX"
url="https://github.com/rabitt/pysox"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'sox')
#source=("https://pypi.io/packages/source/s/sox/sox-${pkgver}.tar.gz")
#md5sums=('36353e16e54b463e76877a408ef89318')
source=("sox-$pkgver::git+https://github.com/rabitt/pysox#commit=eae89bde74567136ec3f723c3e6b369916d9b837")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}"/sox-$pkgver
}

build() {
  cd "${srcdir}"/sox-$pkgver
  python setup.py build
}

package_python-sox() {
  cd "${srcdir}/sox-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}


