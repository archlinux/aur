# Maintainer: Stewart Webb <stew@rtwebb.com>

_pkgname=luigi
pkgname=python-${_pkgname}
pkgver=2.7.8
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python' 'python-daemon' 'python-tornado')
makedepends=('python-setuptools')
url="https://github.com/spotify/luigi"
license=('Apache')
source=(https://github.com/spotify/luigi/archive/${pkgver}.tar.gz)
md5sums=('306deec511edc3ebfcc6ca158e562253')
sha256sums=('d0117738c83824f12ddd3dfe5b62ab6fec2de22c1f517fbe3a51689bbd5d0a35')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
