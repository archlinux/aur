# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergey Mamonov <mrqwer88 (at) gmail (dot) com>
# Contributor: Feirlane

pkgname=adom
pkgver=1.2.0_pre23
pkgrel=2
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=('i686' 'x86_64' 'armv6h')
depends=('ncurses')
url="http://www.adom.de/"
license=('custom: "adom"')
sha1sums=('' '51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
if [ "$CARCH" = x86_64 ]
 then
  _arch_link='debian_64'
  sha1sums[0]='a9cfba4875f770bee9e2d4417942d196cedc0350'
 elif [ "$CARCH" = 'armv6h' ]
  then
  _arch_link='arm'
  sha1sums[0]='29897b84d3288f060557cf1ecbb1bfe3937c082e'
  else
   _arch_link='debian_32'
   sha1sums[0]='c8a2530b499085c45957ee290aba1c0bcf4b0e6e'
fi

source=(http://ancardia.us.to/download/adom_linux_${_arch_link}_${pkgver}.tar.gz LICENSE)

package() {
  cd ${srcdir}/${pkgname}

  install -m755 -D $pkgname ${pkgdir}/usr/bin/$pkgname
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
