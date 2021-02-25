# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pytorch3d
pkgver=0.4.0
pkgrel=1
pkgdesc="Provides efficient, reusable components for 3D Computer Vision research with PyTorch."
arch=('x86_64')
url="https://pytorch3d.org/"
license=('BSD')
depends=('python-fvcore' 'python-iopath')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebookresearch/pytorch3d/archive/v$pkgver.tar.gz")
md5sums=('bfc837fbbd8f0a350276b5c07d2646a7')

build() {
  cd "$srcdir"/pytorch3d-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/pytorch3d-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
