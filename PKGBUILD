# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergey Mamonov <mrqwer88 (at) gmail (dot) com>
# Contributor: Feirlane

pkgname=adom
pkgver=59
pkgrel=1
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=('i686' 'x86_64' 'armv6h')
depends=('ncurses')
url="http://www.adom.de/"
license=('custom: "adom"')
sha1sums=('' '51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
if [ "$CARCH" = x86_64 ]
 then
  _arch_link='debian_64'
  sha1sums[0]='21f0102d9ba8234936f4bd0de3c2a41761f086f5'
 elif [ "$CARCH" = 'armv6h' ]
  then
  _arch_link='arm'
  sha1sums[0]='00c5d07bb1f86a1bb0357d361170dddbbc745a35'
  else
   _arch_link='debian_32'
   sha1sums[0]='9e236660214306803e9c2971632705f17ccfff99'
fi

source=(http://ancardia.us.to/download/adom_linux_${_arch_link}_r${pkgver}_pub.tar.gz LICENSE)

package() {
  cd ${srcdir}/${pkgname}

  install -m755 -D $pkgname ${pkgdir}/usr/bin/$pkgname
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
