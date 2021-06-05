# Maintainer: Nicolas Karolak <nicolas at karolak dot fr>

pkgname="resume-pycli"
pkgver=1.3.1
pkgrel=1
pkgdesc="CLI tool to easily setup a new resume"
arch=(any)
license=("GPL3")
url="https://sr.ht/~nka/resume-pycli"
depends=("python-click" "python-jinja" "python-pdfkit" "python-jsonschema")
makedepends=("python-pytest" "python-setuptools" "python-toml")
provides=("resume-pycli="$pkgver)
conflicts=("resume-pycli")
source=("https://files.pythonhosted.org/packages/b3/38/877442d90dc0bafb059601bc8f2ea4e68ab709c08b90b7a73aeeb58153e9/resume-pycli-1.3.1.tar.gz")
sha256sums=(37ce02c01b3df7ce9300800b30d985669b7fc128fd7b2dbcb9c9f4bc810b63b2)

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
