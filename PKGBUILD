# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-thop"
pkgver=1.0.0
pkgrel=1
pkgdesc='Count the MACs / FLOPs of your PyTorch model.'
arch=(any)
url="https://github.com/Lyken17/pytorch-OpCounter"
license=(MIT)
depends=(python python-pytorch)
conflicts=()
makedepends=(python-setuptools)
source=(pytorch-OpCounter-master.zip::"$url/archive/refs/heads/master.zip")
sha256sums=('9dd5999570452100f8082c360ab3d9cbf9bcad22b7fb87ed8bcfff20dbc02433')

build() {
  cd "${srcdir}/pytorch-OpCounter-master"
  python setup.py build
}

package(){
  depends+=()
  cd "${srcdir}/pytorch-OpCounter-master"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
