# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=python-pdfplumber
pkgver=0.6.0
pkgrel=1
pkgdesc="Plumb a PDF for detailed information about each char, rectangle, and line."
arch=(any)
url="https://github.com/jsvine/pdfplumber"
license=('MIT')
depends=('python>=3.6.0' 'python-pdfminer.six>=20211012' 'python-pillow>=8.4.0' 'python-wand>=0.6.7')
makedepends=('python-setuptools')
changelog=$pkgname.changelog.md
install=$pkgname.install
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("2f952d9a3c68ed8ab5068de93f1ad4cd4e92bbe362e35caae0c40348f193a1a8")

build() {
    cd "$_name-$pkgver/"
    python setup.py build
}

package() {
    cd "$_name-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
