# Maintainer: Thomas Sänger <thomas+aur@gecko.space>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=ubi_reader
pkgver=0.8.5
pkgrel=1
pkgdesc="Collection of Python scripts for reading information about and extracting data from UBI and UBIFS images."
arch=("any")
url="https://github.com/jrspruitt/ubi_reader"
license=("GPL3")
depends=("python" "python-lzo")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/jrspruitt/ubi_reader/archive/refs/tags/v$pkgver-master.tar.gz")
b2sums=('c55bc689af0a32a0e65aa6f860617131654d11ad5e6f7f1e37b4e048718c061f352965f9793595dc16162df0c08ce32d4db2d6bfaee9366110028f7fe61a5c98')

build() {
  cd "${pkgname}-${pkgver}-master"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}-master"
  python setup.py install --optimize=1 --root $pkgdir
}
