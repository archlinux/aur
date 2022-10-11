# Maintainer: Thomas Sänger <thomas+aur@gecko.space>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=ubi_reader
pkgver=0.8.0
pkgrel=1
pkgdesc="Collection of Python scripts for reading information about and extracting data from UBI and UBIFS images."
arch=("any")
url="https://github.com/jrspruitt/ubi_reader"
license=("GPL3")
depends=("python" "python-lzo")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/jrspruitt/ubi_reader/archive/refs/tags/v$pkgver-master.tar.gz")
b2sums=('e802833fcc633739da6cb3cfffb8f398ad27261df55301b6322ea7303aeccbc57f6a685cefa4005ecf80e2a968139d091a8b5c6a9783dd613a5016ba56d55425')

build() {
  cd "${pkgname}-${pkgver}-master"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}-master"
  python setup.py install --optimize=1 --root $pkgdir
}
