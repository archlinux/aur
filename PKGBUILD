# Maintainer: shinrax2

# Contributor: Original maintainer from aur/python-pysimplegui SpotlightKid
# Contributor:Original contributor from aur/python-pysimplegui hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Original contributor from aur/python-pysimplegui Daniel Peukert <daniel@peukert.cc>

pkgbase=python-freesimplegui
pkgname=('python-freesimplegui')
_module='FreeSimpleGUI'
pkgver=5.2.0.post1
pkgrel=1
pkgdesc='Super-simple to create custom GUI, free fork of PySimpleGUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/spyoungtech/FreeSimpleGUI'
depends=('python' 'tk')
makedepends=('python-setuptools' 'python-build' 'python-installer')
checkdepends=('python-pytest-runner')
source=("git+https://github.com/spyoungtech/FreeSimpleGUI.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir"/${_module}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_module}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
