# Maintainer: Sherlock Holo <sherlockya(at)gmail.com>

pkgname=python-pytesseract-git
_pkgname=pytesseract
pkgver=a50fbea
pkgrel=1
pkgdesc="A Python wrapper for Google Tesseract"
arch=('any')
url="https://github.com/madmaze/pytesseract"
license=("GPL3")
depends=('python' 'tesseract')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/madmaze/${_pkgname}.git")

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "${_pkgver}%s"  "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
md5sums=('SKIP')
