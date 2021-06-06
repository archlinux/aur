# Maintainer: Nicolas Karolak <nicolas at karolak dot fr>

pkgname="resume-pycli"
pkgver=1.3.3
pkgrel=1
pkgdesc="CLI tool to easily setup a new resume"
arch=(any)
license=("GPL3")
url="https://sr.ht/~nka/resume-pycli"
depends=("python-click" "python-jinja" "python-pdfkit" "python-jsonschema" "python-beautifulsoup4")
makedepends=("python-pytest" "python-setuptools" "python-toml")
provides=("resume-pycli="$pkgver)
conflicts=("resume-pycli")
source=("https://files.pythonhosted.org/packages/01/f6/6c1637ee17ce229d8283c3de7965267745dca40cf9f7f7f32c5d539b61c8/resume-pycli-1.3.3.tar.gz")
sha256sums=("bc92ad8c9fa9ae18fda95243287ec7e90c03247110a7f6a249297ebc4e14bb9f")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  pytest
}
