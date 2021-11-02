# Maintainer: Joe Bashe <joe@bashe.joe>

_name=pyxdg
pkgname=python2-pyxdg-git
pkgver=0.27
pkgrel=1
pkgdesc='PyXDG is a python library to access freedesktop.org standards.'
arch=('any')
url="https://freedesktop.org/wiki/Software/pyxdg/"
license=('GPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/takluyver/pyxdg/archive/refs/tags/rel-$pkgver.tar.gz")
sha256sums=('a05786e758e3dc81d56c85d2132830fd23c156cadc160d664e486db0ca6e6932')

build() {
  cd "${_name}-rel-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_name}-rel-${pkgver}"
  python2 setup.py install --skip-build \
                           --optimize=1 \
                           --prefix=/usr \
                           --root="${pkgdir}"
}
