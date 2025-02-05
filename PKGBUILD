
# Maintainer: Samuel Henrique De Morais Vitrio <samuelhenriquemoraisvitrio@gmail.com>
# Contributor: Mateus Moutinho Queiroz <mateusmoutinho01@gmail.com>

pkgname=serjaoberranteiro-server
pkgver=5
pkgrel=2
pkgdesc="Library for web development"
arch=('x86_64')
url="https://github.com/SamuelHenriqueDeMoraisVitrio/SerjaoBerranteiroServer"
license=('MIT')
depends=('lua')
source=("https://github.com/SamuelHenriqueDeMoraisVitrio/SerjaoBerranteiroServer/releases/download/V5/serjao_server.zip")
sha256sums=('8a541c88a3fbccd4efd5aa27d77b064565aa6cc73e0c4602ae06f01075e081ef')

package() {
  cd "$srcdir/serjao_berranteiro"

  lua_ver=$(lua -e 'print(_VERSION:match("%d+%.%d+"))')

  install -Dm755 serjao_berranteiro.so "$pkgdir/usr/lib/lua/$lua_ver/serjao_berranteiro.so"
  install -Dm644 serjao_berranteiro.lua "$pkgdir/usr/share/lua/$lua_ver/serjao_berranteiro.lua"
}


