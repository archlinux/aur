# Maintainer: Jean Lucas <jean@4ray.co>

# Based on python-torchvision-git by Stephen Zhang

pkgname=python-torchvision
_pkgname=vision
pkgver=0.2.0
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision'
arch=(any)
url='https://github.com/pytorch/vision'
license=(BSD)
depends=(python python-pytorch)
makedepends=(python-setuptools)
source=(https://github.com/pytorch/$_pkgname/archive/v$pkgver.zip)
sha512sums=(9fcd670a6c5382e06bf130bed408cf2293b94549638b657083851cabdfa2695ec4a5abd78896a0ac427d7d1f987957dfb6d9ddfe0f6aaba4ebb3e3310775149b)

package() {
  cd $srcdir/$_pkgname-$pkgver

  python setup.py install --root=$pkgdir --optimize=1

  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
