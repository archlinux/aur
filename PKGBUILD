# Maintainer: piernov <piernov@piernov.org>

pkgname=python-resnest
pkgver=0.0.5
pkgrel=1
pkgdesc="Split-Attention Network, A New ResNet Variant"
arch=('any')
url="https://github.com/zhanghang1989/ResNeSt"
license=('APACHE')
depends=('python-numpy' 'python-tqdm' 'python-nose' 'python-pytorch' 'python-pillow' 'python-scipy' 'python-requests' 'python-iopath' 'python-fvcore')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zhanghang1989/ResNeSt/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('7d15e0681ba1ea12f9ec63b0d4842ed6')

build() {
  cd "$srcdir"/ResNeSt-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/ResNeSt-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
