# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=python-ipadic
_gitname=ipadic-py
pkgver=1.0.0
pkgrel=2

pkgdesc="IPAdic packaged for easy use from Python"
url="https://github.com/polm/ipadic-py"
license=(MIT)
arch=(any)

depends=(python)
makedepends=(python-setuptools)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ed851e6dd6f79ce6bdd10075b471dba4985f56c3a5b11e304e23d62dd80547a0116081aa93753b56dc745b13c4391e05a20ab3dff19c7cca5c27ab10353fdf8c')

build() {
  cd "$_gitname-$pkgver"
  python setup.py build
}

package() {
  cd "$_gitname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
