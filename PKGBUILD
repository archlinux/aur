# Maintainer: Yarema aka Knedlyk <yupadmin at gmail dot com>
# Contributor: Yarema aka Knedlyk <yupadmin at gmail dot com>

pkgbase=python-getdevinfo
pkgname=('python-getdevinfo')
pkgver=2.0.0
pkgrel=2
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
sha256sums=('4ec4f6829f4d915cfed9d352b8794a89aa01c526e9e794663c03ef6261ab6113')
