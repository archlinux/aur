# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=hickle
pkgname="python-$_name"
pkgver=5.0.2
pkgrel=1
pkgdesc='Hickle - a HDF5 based version of pickle'
arch=('any')
url="http://github.com/telegraphic/$_name"
license=('MIT')
depends=('python' 'python-h5py' 'python-numpy')
makedepends=('python-setuptools')
#checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner' 'python-scipy' 'python-pandas' 'check-manifest' 'twine')
source=("https://github.com/telegraphic/$_name/archive/v$pkgver.tar.gz")
sha256sums=('00e9f1ca3a76c7e39ef9a0a998f420d78eea5b7b495f82049fb16b3374745db3')

build() {
  cd $_name-$pkgver
  python setup.py build
}
#check() {
#  cd $_name-$pkgver
#  check-manifest
#  twine check dist/*
#  python setup.py test
#}
package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
