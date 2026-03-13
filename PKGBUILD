# Maintainer: Yarema aka Knedlyk <yupadmin at gmail dot com>
# Contributor: Yarema aka Knedlyk <yupadmin at gmail dot com>

pkgbase=python-getdevinfo
pkgname=('python-getdevinfo')
pkgver=2.0.1
pkgrel=1
pkgdesc="A device information gatherer for Linux and macOS."
arch=('any')
url="https://www.hamishmb.com/html/downloads.php?program_name=getdevinfo"
license=('PSF')
makedepends=('python-setuptools')
depends=('python' 'lshw' 'lvm2')

source=("https://www.hamishmb.com/files/downloads/getdevinfo/${pkgver}/Python/getdevinfo-${pkgver}.tar.gz")

prepare() {
  cd "$srcdir"/getdevinfo-$pkgver
}

build() {
  cd "$srcdir"/getdevinfo-$pkgver
  python setup.py build

#  cd "$srcdir"/getdevinfo-$pkgver
#  python setup.py build
}

package() {

  cd getdevinfo-$pkgver
  python setup.py install --root="$pkgdir"
}

sha256sums=('61a103aa6703c3f2cb36dc0fa4e6156bdd732e4466a771f07da27a4c03c2c173')
