# Maintainer: Cilyan Olowen <gaknar@gmail.com>
pkgname=python-sphinxcontrib-globalsubs
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Sphinx needs extension to add support for global substitutions to conf.py"
arch=("any")
url="https://github.com/missinglinkelectronics/sphinxcontrib-globalsubs"
license=('BSD')
depends=('python-sphinx')
makedepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("83df8b5a5d72dfb3e2250d91f621df3a0aac3fe34c470dd3a7d6d9a3e101aeda")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.txt
}

