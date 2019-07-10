# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=hickle
pkgname="python-$_name"
pkgver=3.4.4
pkgrel=1
pkgdesc='Hickle - a HDF5 based version of pickle'
arch=('any')
url="http://github.com/telegraphic/$_name"
license=('MIT')
depends=('python' 'python-h5py' 'python-numpy' 'python-dill')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner' 'python-scipy' 'python-pandas' 'python-coveralls')
source=("https://github.com/telegraphic/$_name/archive/$pkgver.tar.gz")
sha256sums=('4f6048a06df7c4d7e56a1d2b00803f8a5ac95d4c384868acdd7bf91d2dfecef2')

build() {
  cd $_name-$pkgver
  python setup.py build
}
check() {
  cd $_name-$pkgver
  python setup.py test
}
package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
