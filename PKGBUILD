# Maintainer: Nicolas Karolak <nicolas at karolak dot fr>

pkgname="resume-pycli"
pkgver=1.3.0
pkgrel=1
pkgdesc="CLI tool to easily setup a new resume"
arch=(any)
license=("GPL3")
url="https://sr.ht/~nka/resume-pycli"
depends=("python-click" "python-jinja" "python-pdfkit" "python-jsonschema")
makedepends=("python-pytest" "python-setuptools" "python-toml")
provides=("resume-pycli="$pkgver)
conflicts=("resume-pycli")
source=("https://files.pythonhosted.org/packages/75/7e/d844c55f585b188416e6c7ed887f206681c5e22025a0554c565923408b09/resume-pycli-1.3.0.tar.gz")
sha256sums=("eaf6747ea4b81c82f9344bbeeddb0b9694d7924f004d8e69fc0ff27304ef4d28")

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
