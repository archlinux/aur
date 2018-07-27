# Maintainer: Alexandre Jesus <adbjesus@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_pkgname=luigi
pkgname=python-${_pkgname}
pkgver=2.7.6
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python' 'python-daemon' 'python-tornado')
makedepends=('python-setuptools')
url="https://github.com/spotify/luigi"
license=('Apache')
source=(https://github.com/spotify/luigi/archive/${pkgver}.tar.gz)
md5sums=('b42ad20d745441b740c52f5d362cee23')
sha256sums=('e0b04c0dd98e845d7bb8bb2148164ce5a3d20fbfb99c5cbbfaecb4bd3fbf7843')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
