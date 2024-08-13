pkgname=python-m-loop
_pkgname=M-LOOP
pkgver=3.3.4
pkgrel=1
pkgdesc='Rapidly optimize the parameters of a scientific experiment or computer controller system'
arch=('any')
url='https://github.com/michaelhush/M-LOOP/'
license=('MIT')
depends=('python' 'python-setuptools' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-tensorflow' 'python-scikit-learn' 'python-pytest')
source=("https://github.com/michaelhush/M-LOOP/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e386ed0b90fb6e0edbea908cfac3e11492a973a30f180b9a5f95c564ddfff5e')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
}
