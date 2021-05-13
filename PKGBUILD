# Maintainer: Nicolas Karolak <nicolas at karolak dot fr>

pkgname="resume-pycli"
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI tool to easily setup a new resume"
arch=(any)
license=("GPL3")
url="https://sr.ht/~nka/resume-pycli"
depends=("python-click" "python-jinja" "python-pdfkit" "python-jsonschema")
makedepends=("python-setuptools")
provides=("resume-pycli="$pkgver)
conflicts=("resume-pycli")
source=("https://files.pythonhosted.org/packages/73/fd/83686d595efb8e6dc56d932fd5fb4c006e2c2b1410ec77ec0fa00517a5a6/resume-pycli-1.1.0.tar.gz")
sha256sums=("903584b56738f0f94423e6047ba06e67ce5080401884a5960ec9edb0b59815d3")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
