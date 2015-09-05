# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=sc-im
pkgver=0.1.9
pkgrel=1
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64')
url='https://github.com/andmarti1424/sc-im'
license=('BSD')
conflicts=('scim-spreadsheet')
source=("https://github.com/andmarti1424/${pkgname%-spreadsheet}/archive/v${pkgver}.tar.gz")
sha256sums=('b12ab5b87772c1445172123dab7575b64276bbb4fa521ff9971989c07a64533c')
MAKEFLAGS='-j1'

build() {
  cd "${pkgname%-spreadsheet}-$pkgver/src"
  make
}

package() {
  cd "${pkgname%-spreadsheet}-$pkgver/src"
  make DESTDIR="$pkgdir" install

  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
