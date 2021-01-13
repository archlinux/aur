# Maintainer: Major <majorx234@gmail.com>

pkgname=python-importmagic-git
pkgver=r109.a6cde18
pkgrel=1
pkgdesc="Automatically manage imports in Python"
arch=('any')
url="https://github.com/alecthomas/importmagic"
license=('BSD')
makedepends=('git' 'python' 'python-setuptools')
depends=('python')
source=("$pkgname"::"git+https://github.com/alecthomas/importmagic.git")
sha256sums=('SKIP')
conflicts=('python-importmagic')
provides=('python-importmagic')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
  cd "${srcdir}/$pkgname"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
