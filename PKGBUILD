# Maintainer: Nicolas Karolak <nicolas at karolak dot fr>

pkgname="resume-pycli"
pkgver=1.1.2
pkgrel=1
pkgdesc="CLI tool to easily setup a new resume"
arch=(any)
license=("GPL3")
url="https://sr.ht/~nka/resume-pycli"
depends=("python-click" "python-jinja" "python-pdfkit" "python-jsonschema")
makedepends=("python-pytest" "python-setuptools")
provides=("resume-pycli="$pkgver)
conflicts=("resume-pycli")
source=("https://files.pythonhosted.org/packages/d7/8b/9ba540964394ff6e5fd77f5fb37247eeb93ad97371dc7abb465e95172a88/resume-pycli-1.1.2.tar.gz")
sha256sums=("b541b698038c127816619a3824f09f0c0b87403250ae8faee1d35cd7c7e1289f")

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
