# Maintainer: Nicolas Karolak <nicolas at karolak dot fr>

pkgname="resume-pycli"
pkgver=1.3.2
pkgrel=2
pkgdesc="CLI tool to easily setup a new resume"
arch=(any)
license=("GPL3")
url="https://sr.ht/~nka/resume-pycli"
depends=("python-click" "python-jinja" "python-pdfkit" "python-jsonschema" "python-beautifulsoup4")
makedepends=("python-pytest" "python-setuptools" "python-toml")
provides=("resume-pycli="$pkgver)
conflicts=("resume-pycli")
source=("https://files.pythonhosted.org/packages/5a/d9/4498a82739adaa030b1e58088aa9aead023f3ab402788d56237788082250/resume-pycli-1.3.2.tar.gz")
sha256sums=("0a08f92b7f83a90a1250b28140e1029b9b2d2617e3629b30103532b0a393b966")

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
