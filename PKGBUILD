# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=flake8-docstrings
pkgver=0.2.6
pkgrel=1
pkgdesc="A plugin to flake8 to include checks provided by pydocstyle"
arch=('any')
url="https://gitlab.com/pycqa/flake8-docstrings"
license=('MIT')
depends=('flake8' 'pydocstyle')
makedepends=('python-setuptools')
source=("https://github.com/PyCQA/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('185b59fe10d6ca7a4b589f574734d8b46426581d79d1d1e4da68988ba388bfe4')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/pycodestyle/pydocstyle/' "flake8_docstrings.py"
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

