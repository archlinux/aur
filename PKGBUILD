# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=flake8-docstrings
pkgver=0.2.8
pkgrel=1
pkgdesc="A plugin to flake8 to include checks provided by pydocstyle"
arch=('any')
url="https://gitlab.com/pycqa/flake8-docstrings"
license=('MIT')
depends=('flake8' 'pydocstyle')
makedepends=('python-setuptools')
source=("https://github.com/PyCQA/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('48be6b1eb1711e18714965bbc6475de9b698e5dd1a6abcc65aad0d4a4d403302')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/pycodestyle/pydocstyle/' "flake8_docstrings.py"
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

