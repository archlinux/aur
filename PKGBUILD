# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-patatt
_name=patatt
pkgver=0.4.9
pkgrel=1
pkgdesc="A simple library to add cryptographic attestation to patches sent via email"
arch=("any")
depends=('python-pynacl')
url="https://git.kernel.org/pub/scm/utils/patatt/patatt.git/about/"
license=("MIT")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

build() {
  cd "$srcdir"/$_name-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/$_name-$pkgver

  python setup.py install --root="$pkgdir"
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('a8784dc603f8def0528eb1e9d98833ab927f7fa632043e150d3a7d4b5b9deb3a')
