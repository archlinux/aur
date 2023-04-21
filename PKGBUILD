# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=rofi-connman
pkgver=0.5
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
sha256sums=('8a92dbcd090ff3ff01c337baeaf9c126a5ea7dd2ae0252d8ae313d282df263e0')

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
