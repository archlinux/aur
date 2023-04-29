# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=python-passwdgen
_name=passwdgen
pkgver=0.4.0
pkgrel=1
pkgdesc=" A simple password generation utility "
arch=('any')
url="https://github.com/thanethomson/passwdgen"
license=('MIT')
depends=('python' 'python-pyperclip')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
optdepends=()
provides=($_name)
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('081437e2f2958a0df934ec6de37c383f0c465675709f4e650f46c89c08484c94')

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
