# Maintainer: Nicolas Karolak <nicolas at karolak dot fr>

pkgname="resume-pycli"
pkgver=1.1.3
pkgrel=1
pkgdesc="CLI tool to easily setup a new resume"
arch=(any)
license=("GPL3")
url="https://sr.ht/~nka/resume-pycli"
depends=("python-click" "python-jinja" "python-pdfkit" "python-jsonschema")
makedepends=("python-pytest" "python-setuptools")
provides=("resume-pycli="$pkgver)
conflicts=("resume-pycli")
source=("https://files.pythonhosted.org/packages/29/26/929468ccf3952335f3c8eb19ca0b365b7c9656d51064e5484cc6eb82f18f/resume-pycli-1.1.3.tar.gz")
sha256sums=("e7ddb25fb0369af865786cf5db031959a537512f032b9a1b735cfda0c28d82c0")

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
