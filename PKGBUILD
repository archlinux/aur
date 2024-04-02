# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

pkgname=python-overpy
pkgver=0.7
pkgrel=1
pkgdesc="Python Wrapper to access the Overpass API"
arch=(any)
url="https://github.com/DinoTools/python-overpy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git' 'python-pytest-runner')
source=(git+https://github.com/DinoTools/python-overpy.git#tag=$pkgver)
sha256sums=('76dbdad0d2150342a632f8e0fcc1f4524ad876f9a6fe2f1d88db6c755a0fb05c')

buid() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
