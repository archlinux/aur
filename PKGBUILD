# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=python-pdfplumber
pkgver=0.5.28
pkgrel=2
pkgdesc="Plumb a PDF for detailed information about each char, rectangle, and line."
arch=(any)
url="https://github.com/jsvine/pdfplumber"
license=('MIT')
depends=('python>=3.6.0' 'python-pdfminer.six>=20200517' 'python-pillow>=7.0.0' 'python-wand')
makedepends=('python-setuptools')
changelog=$pkgname.changelog.md
install=$pkgname.install
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("1498e71df07f3d684788b22a6a764526dd73d6b9d7365c1239fef6ea6a1375c6")

build() {
    cd "$_name-$pkgver/"
    python setup.py build
}

package() {
    cd "$_name-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
