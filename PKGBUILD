# Maintainer: piernov <piernov@piernov.org>

pkgname=python-efficientnet-pytorch
pkgver=1.0
pkgrel=1
pkgdesc="PyTorch implementation of EfficientNet"
arch=('any')
url="https://github.com/lukemelas/EfficientNet-PyTorch"
license=('APACHE')
depends=('python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lukemelas/EfficientNet-PyTorch/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('01789984000ff1de132094cadf85fb2973f474aab61715cc8acab6918d59bd80')

build() {
  cd "$srcdir"/EfficientNet-PyTorch-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/EfficientNet-PyTorch-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
