# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=scim-spreadsheet
pkgver=0.1.9
pkgrel=1
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64')
url='https://github.com/andmarti1424/scim'
license=('BSD')
source=("https://github.com/andmarti1424/${pkgname%-spreadsheet}/archive/v${pkgver}.tar.gz")
sha256sums=('5fa93d9a6dd1c60eaf103f6588d3a2895a8dbe4c3c7474765f803345c8f83203')

build() {
  cd "${pkgname%-spreadsheet}-$pkgver/src"
  make
}

package() {
  cd "${pkgname%-spreadsheet}-$pkgver/src"
  make DESTDIR="$pkgdir" install

  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
