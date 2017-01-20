# Maintainer: Alexandre Jesus <adbjesus@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_pkgname=luigi
pkgname=python-${_pkgname}
pkgver=2.5.0
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python' 'python-daemon' 'python-tornado')
makedepends=('python-setuptools')
url="https://github.com/spotify/luigi"
license=('Apache')
source=(https://github.com/spotify/luigi/archive/2.5.0.tar.gz)
md5sums=('5034f2db41f100d6dd12a59f70e19544')
sha256sums=('6d4ecdadf36bff364e471e38fac619a8bbc7edf1f2167ffbdc0188494f1487e0')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
