# Maintainer: CYBERDEViL <cyberdev [at] disroot [dot] org>
pkgname=searx-qt
_pkgver=0.5.0-alpha1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Desktop client application for Searx/SearXNG/searx-space"
arch=('any')
url="https://notabug.org/CYBERDEViL/searx-qt"
license=('GPL3')
depends=('python-requests' 'python-pyqt5' 'python-jsonschema'
         'python-beautifulsoup4')
optdepends=('python-pysocks: socks proxy support')
makedepends=('gettext' 'qt5-tools')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha512sums=('99e7c67126e5c4b16ee01a79574f511a480df304de92b8eb704b0d025e486581de4c6dc5f783361b2c4ef6e989e5f59a261221b634697a69b9d4587eea3a28e3')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
