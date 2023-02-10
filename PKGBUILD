# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-visdom
_name=visdom
pkgver=0.2.4
pkgrel=2
pkgdesc='A flexible tool for creating, organizing, and sharing visualizations of live, rich data. Supports Torch and Numpy.'
arch=(any)
url='https://github.com/facebookresearch/visdom'
license=('Apache')
depends=(
  python-jsonpatch
  python-networkx
  python-numpy 
  python-pytorch 
  python-requests
  python-scipy 
  python-six
  python-tqdm
  python-websocket-client
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  "${pkgname}-${pkgver}.tar.gz"::"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha512sums=('007aa1c70f3335fec3c811a9492e85610c75b79e9295a8d5eb4539fcb75b3ea00bd453adf7404113644bfc431f77223f7d524c6c6c07b970366fb3523a1b83b9')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
