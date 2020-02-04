# Maintainer: loathingkernel <loathingkernel a_ gmail d_ com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Allan McRae (allan <at> archlinux <dot> org)
# Contributor: Alexander 'bas' Brovikov (bas <at> it-core <dot> org)

pkgname=wine-gecko-bin
pkgver=2.47.1
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's Internet Explorer"
arch=('x86_64')
url="https://wiki.winehq.org/Gecko"
license=('MPL')
depends=('wine')
provides=("${pkgname/-bin/}=$pkgver")
options=('!strip')
source=(https://dl.winehq.org/wine/wine-gecko/$pkgver/wine-gecko-$pkgver-x86.tar.bz2)
source_x86_64=(https://dl.winehq.org/wine/wine-gecko/$pkgver/wine-gecko-$pkgver-x86_64.tar.bz2)
md5sums=('660741a74b9f4e5e861d362345cf027c')
md5sums_x86_64=('e23569fd04c86054022941ca876bb1d7')

package() {
  install -Dm 755 -d "$pkgdir"/usr/share/wine/gecko/
  cp -dr --no-preserve='ownership' ${pkgname/-bin/}-$pkgver-x86{,_64} "$pkgdir"/usr/share/wine/gecko/
}
