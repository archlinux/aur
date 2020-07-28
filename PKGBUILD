# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=hickle
pkgname="python-$_name"
pkgver=4.0.1
pkgrel=1
pkgdesc='Hickle - a HDF5 based version of pickle'
arch=('any')
url="http://github.com/telegraphic/$_name"
license=('MIT')
depends=('python' 'python-h5py' 'python-numpy' 'python-dill')
#checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner' 'python-scipy' 'python-pandas' 'python-codecov' 'check-manifest' 'twine')
source=("https://github.com/telegraphic/$_name/archive/v$pkgver.tar.gz")
sha256sums=('8a54870bf4ad5cad5b071ca0a8320998cde83173915b303604891856636532d6')

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
