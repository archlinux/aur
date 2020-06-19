# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=hickle
pkgname="python-$_name"
pkgver=3.4.7
pkgrel=1
pkgdesc='Hickle - a HDF5 based version of pickle'
arch=('any')
url="http://github.com/telegraphic/$_name"
license=('MIT')
depends=('python' 'python-h5py' 'python-numpy' 'python-dill')
#checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner' 'python-scipy' 'python-pandas' 'python-codecov' 'check-manifest' 'twine')
source=("https://github.com/telegraphic/$_name/archive/$pkgver.tar.gz")
sha256sums=('984133f8f4ad79d8a3f5c27eb9e6ff2cf331fe11c8b8f74d4796097d8d04e79c')

build() {
  cd $_name-$pkgver
  python setup.py build
}
check() {
  cd $_name-$pkgver
  #check-manifest
  #twine check dist/*
  #python setup.py test
}
package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
