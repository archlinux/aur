# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Thomas Sänger <thomas+aur@gecko.space>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=ubi_reader
pkgver=0.8.14
pkgrel=1
pkgdesc="Collection of Python scripts for reading information about and extracting data from UBI and UBIFS images."
arch=("any")
url="https://github.com/onekey-sec/ubi_reader"
license=("GPL-3.0-or-later")
depends=("python" "python-lzo" "python-lzallright" "python-cryptography" "python-zstandard")
makedepends=("python-build" "python-installer" "python-wheel" "python-poetry")
source=("$pkgname-$pkgver.tar.gz::https://github.com/onekey-sec/ubi_reader/archive/refs/tags/$pkgver.tar.gz")
b2sums=('e84700ac83937850dc4237a2018fbafaa07642f2d540fcb3d36a2eb69fbf5eeb8d9bef3b1132cefa2272b1c47b013980ad3ae3473d6cd3416168aea01d2a52b4')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
