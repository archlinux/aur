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
pkgver=57
pkgrel=2
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
  _arch_link='ubuntu_64'
  sha1sums[0]='47bf8c7790c0e7b63a8a04c6c37e2b0df0ba052b'
  depends+=('libtinfo')
 elif [ "$CARCH" = 'armv6h' ]
  then
  _arch_link='arm'
  sha1sums[0]='343ee4b8617603c8b065e19ddf01099030b8b03c'
 else
  _arch_link='debian_32'
  sha1sums[0]='d4bcb519ff13c304d0f0a3c46c11258f4dff9ff2'
fi


source=(http://www.ancardia.com/secure/download/current/adom_linux_${_arch_link}_r${pkgver}.tar.gz LICENSE)

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom-restricted/LICENSE
}
