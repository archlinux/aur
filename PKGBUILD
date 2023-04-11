# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=python-passwdgen
_name=passwdgen
pkgver=0.3.1
pkgrel=1
pkgdesc=" A simple password generation utility "
arch=('any')
url="https://github.com/thanethomson/passwdgen"
license=('MIT')
depends=('python' 'python-pyperclip')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8f52c277633b461b53f1b18ef809a21d20c04a0cbdf6a9f67cff2596d4b328d6')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m unittest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
