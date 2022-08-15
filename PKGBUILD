# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=rofi-connman
pkgver=0.3
pkgrel=1
pkgdesc="menu-driven connman interface"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/sourcemage/rofi-connman"
depends=('rofi' 'connman' 'empty')
optdepends=('dmenu: to use dmenu instead of rofi'
            'sexpect: to use sexpect instead of empty'
            'mawk: for faster profile processing')

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('31512cbbbf2b46dfe4585b6781d86cf6df055f15feea09a94bea6ea16aeab034')

build() {
  cd "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 -t "${pkgdir}/usr/bin/" rofi-connman

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for d in AUTHORS README.md TODO; do
    install -Dm644 $d "${pkgdir}/usr/share/doc/${pkgname}/${d}"
  done
}
