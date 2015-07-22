# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergey Mamonov <mrqwer88 (at) gmail (dot) com>
# Contributor: Feirlane

# This is a PKGBUILD for ADOM prereleases restricted only to Indiegogo campaign donors.
# Please fill in the username and password you received by email for the download link to work.

_username=
_password=

DLAGENTS=("http::/usr/bin/wget --user ${_username} --password ${_password} %u")

pkgname=adom-restricted
pkgver=58
pkgrel=1
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=('i686' 'x86_64' 'armv6h')
conflicts=('adom')
provides=('adom')
depends=('ncurses')
url="http://www.adom.de/"
license=('custom: "adom"')
sha1sums=('' '51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
if [ "$CARCH" = x86_64 ]
  then
  _arch_link='debian_64'
  sha1sums[0]='ff6e73bf084992fbbf4730d4aa5cf21d9b132391'
 elif [ "$CARCH" = 'armv6h' ]
  then
  _arch_link='arm'
  sha1sums[0]='e61fbb507c4d8c30ced3c8b4c99ea06db3b45c41'
 else
  _arch_link='debian_32'
  sha1sums[0]='4aa867795043a88d04c7fcf2a72aa302cc9f3c63'
fi


source=(http://www.ancardia.com/secure/download/current/adom_linux_${_arch_link}_r${pkgver}.tar.gz LICENSE)

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom-restricted/LICENSE
}
