# Maintainer: Holden Lewis <holdenplewis at gmail dot com>

pkgname=impostor-server-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Unofficial dedicated server for Among Us (binary release).'
url='https://aeonlucid.com/Impostor/'
arch=('x86_64')
license=('GPL3')
depends=()
provides=()
conflicts=()
source=("https://github.com/AeonLucid/Impostor/releases/download/v${pkgver}/Impostor-Server-linux-x64.zip")
sha512sums=('f05213362fd5415608e6cebfd01250ebbb2bba320561d77c9bd20cb91e41c112faa3b8db2d4ecc3afccf2c2b28553516bc53a05c07218603200f2835e6b5f2b6')

prepare() {
  mv Impostor.Server impostor-server
  chmod +x impostor-server
}

package() {
  
  mkdir -p "${pkgdir}/usr/bin/"

  cp --verbose "${srcdir}/impostor-server" "${pkgdir}/usr/bin/impostor-server"
}
