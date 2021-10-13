# Maintainer: Andre Kugland <kugland at gmail dot com>

pkgname=neocities-sync
pkgver=0.1.0
pkgrel=1
pkgdesc="Sync local directories with neocities.org sites"
arch=("any")
url="https://github.com/kugland/neocities-sync"
license=('MIT')
depends=('python-pathspec')
makedepends=('python-setuptools')
optdepends=('python-colorama: beautiful colors')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('585478e6d4c4f8a82c332af0a960783ffae3ff84d24072d0c95fd8c1d1bac7931bb4172572038fc5e6ace5ffe03b48bc209244eb17b23b579f242d1ba3948cf0')

build() {
  cd $pkgname-$pkgver
  python setup.py config
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
