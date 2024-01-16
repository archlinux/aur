# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=feeluown-download
pkgver=0.3
pkgrel=1
pkgdesc="FeelUOwn download plugin"
arch=('any')
url="https://github.com/feeluown/feeluown-download"
license=('GPL-3.0-or-later')
depends=('feeluown' 'python-requests' 'python-mutagen')
makedepends=('python-setuptools' 'python-pip')
source=("https://pypi.io/packages/source/f/fuo_dl/fuo_dl-$pkgver.tar.gz")
sha512sums=('2afdacfd7f16fb1bb7e6cedc4a548bbc634d071a9656252767725889acb2a4bd66f9fc4af5924efa73144fff90f23c56ac9fa08d0442b7ee78e3fa19167e8b83')

build() {
  cd fuo_dl-$pkgver
  python setup.py build
}

package() {
  cd fuo_dl-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
