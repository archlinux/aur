# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=hickle
pkgname="python-$_name"
pkgver=3.4.3
pkgrel=2
pkgdesc='Hickle - a HDF5 based version of pickle'
arch=('any')
url="http://github.com/telegraphic/$_name"
license=('MIT')
depends=('python' 'python-h5py')
checkdepends=('python-pytest' 'python-scipy' 'python-pandas')
source=("https://github.com/telegraphic/$_name/archive/$pkgver.tar.gz")
sha256sums=('09ebc4ad52ec2f1392df5334a9b2150527aec4f78ae1c9f96b66e1eb8c085516')

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
