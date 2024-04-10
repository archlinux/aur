# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Stijn Seghers (Procrat) <stijnseghers at gmail dot com>

pkgname=pylama
pkgver=8.4.1
pkgrel=1
pkgdesc="Code audit tool for python"
arch=('any')
url="https://github.com/klen/pylama"
license=('GPL3')
depends=('python-pycodestyle' 'python-pydocstyle' 'python-pyflakes' 'python-mccabe')
makedepends=('python-setuptools')
optdepends=('python-radon: radon support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/klen/pylama/archive/$pkgver.tar.gz")
sha256sums=('6968f9c49ed04cff4010c2cd01a12d39c76f4f0dd0e96e381f5e9af39037bf21')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
