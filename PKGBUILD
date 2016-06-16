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
pkgver=65
pkgrel=2
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=("i686" "x86_64" "armv6h")
conflicts=("adom")
depends=("ncurses5-compat-libs")
url="http://www.adom.de/"
license=('custom: "adom"')

_source_url="http://www.ancardia.com/secure/download/r${pkgver}"
source=(LICENSE)
source_i686=(${_source_url}/adom_linux_debian_32_r${pkgver}.tar.gz)
source_x86_64=(${_source_url}/adom_linux_debian_64_r${pkgver}.tar.gz)
source_armv6h=(${_source_url}/adom_linux_arm_r${pkgver}.tar.gz)

sha1sums=("51d28fe3f0420cd354113fd7ceb2a1a7abf1b069")
sha1sums_i686=("342b5f699814be3f23aad9bd3dea82769aa8abd9")
sha1sums_x86_64=("6d03733a72a1c77bceb067092d046a5ea46630c1")
sha1sums_armv6h=("b8c1cc845b583040416265cdd188ab4cd72bffd6")

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom-restricted/LICENSE
}
