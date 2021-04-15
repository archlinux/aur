# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-untokenize'
_pkgname='untokenize'
pkgver=0.1.1
pkgrel=1
pkgdesc='Transforms tokens into source code'
url='https://github.com/myint/untokenize'
checkdepends=()
depends=()
makedepends=()
optdepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3865dbbbb8efb4bb5eaa72f1be7f3e0be00ea8b7f125c69cbd1f5fda926f37a2')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
  cd "$_pkgname-$pkgver"
  python test_untokenize.py
}

