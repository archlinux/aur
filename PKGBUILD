# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Thomas Sänger <thomas+aur@gecko.space>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=ubi_reader
pkgver=0.8.12
pkgrel=1
pkgdesc="Collection of Python scripts for reading information about and extracting data from UBI and UBIFS images."
arch=("any")
url="https://github.com/jrspruitt/ubi_reader"
license=("GPL3")
depends=("python" "python-lzo")
makedepends=("python-build" "python-installer" "python-wheel" "python-poetry")
source=("$pkgname-$pkgver.tar.gz::https://github.com/onekey-sec/ubi_reader/archive/refs/tags/$pkgver.tar.gz")
b2sums=('c274e89c9f62127d36f06ac5cebec8d5a4806bf7c1746d9bad4adaafe9b5e8add79cd0c5b267d815fdc0b9c6c9c2033ca905e6fa464fec11ebc94f973ecb4d32')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
