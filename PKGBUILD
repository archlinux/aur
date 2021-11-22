# Maintainer: Bruce Zhang <zttt183525594@gmail.com>

pkgname=feeluown-bilibili
pkgver=0.1.3
pkgrel=1
pkgdesc="FeelUOwn plugin for bilibili"
arch=('any')
url="https://github.com/feeluown/feeluown-bilibili"
license=('GPL3')
depends=('feeluown' 'python-aiohttp' 'python-bilibili-api')
makedepends=('python-setuptools' 'python-pip')
source=("https://pypi.io/packages/source/f/fuo_bilibili/fuo_bilibili-$pkgver.tar.gz")
sha512sums=('da1bb32dfbf9b0f7e953ea116771e867f1247c9da06dcb4d60d8843dbd1f1cbb9d19d3312d5ddacf4e20f518bacbc6d28317e9e13ff82eec9ef196410b71889c')

build() {
  cd fuo_bilibili-$pkgver
  python setup.py build
}

package() {
  cd fuo_bilibili-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
