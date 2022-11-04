# Maintainer: Khorne <khorne AT khorne DOT me>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname=python-tika
pkgver=1.24
pkgrel=2
pkgdesc="Apache Tika Python library"
arch=('any')
url="http://github.com/chrismattmann/tika-python"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/chrismattmann/tika-python#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/tika-python"
    python setup.py build
}


package() {
  cd "$srcdir/tika-python"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

