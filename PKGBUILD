# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=hickle
pkgname="python-$_name"
pkgver=5.0.0
pkgrel=1
pkgdesc='Hickle - a HDF5 based version of pickle'
arch=('any')
url="http://github.com/telegraphic/$_name"
license=('MIT')
depends=('python' 'python-h5py' 'python-numpy' 'python-dill')
makedepends=('python-setuptools')
#checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner' 'python-scipy' 'python-pandas' 'check-manifest' 'twine')
source=("https://github.com/telegraphic/$_name/archive/v$pkgver.tar.gz")
sha256sums=('e1114a351fba5a73fb78af90754d376c70a3dd1de9f0343bb14c5b5f7de9cd31')

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
