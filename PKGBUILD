# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=flake8-docstrings
pkgver=1.3.0
_commit=343a54020815e526100f747b7b391fd5b08c92ea
pkgrel=2
pkgdesc="A plugin to flake8 to include checks provided by pydocstyle"
arch=('any')
url="https://gitlab.com/pycqa/flake8-docstrings"
license=('MIT')
depends=('flake8' 'python-pydocstyle' 'python-flake8-polyfill')
makedepends=('python-setuptools')
source=("https://gitlab.com/pycqa/$pkgname/-/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('be225a2f0b2a5a19f6c9b688fe493d533dce1f2bcb92787932ff9a940ccb9e5f')

package() {
  cd "$pkgname-$_commit"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
