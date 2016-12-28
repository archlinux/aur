# Maintainer: Alexandre Jesus <adbjesus@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_pkgname=luigi
pkgname=python-${_pkgname}
pkgver=2.4.0
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python' 'python-daemon' 'python-tornado')
makedepends=('python-setuptools')
conflicts=('luigi')
url="https://github.com/spotify/luigi"
license=('Apache')
source=(https://pypi.python.org/packages/6a/84/42bea7839bc6eee8c219775f6afe3e296a554985a0aa216fb6090478a3e5/luigi-2.4.0.tar.gz)
md5sums=('76303fa7281ac0c6a95aa9ada13acc3e')
sha256sums=('5c63d960c5219346acf29b925f5de7585427555a863b5f9e27fa19611f2d8382')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
