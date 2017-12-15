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
epoch=1
pkgver=3.0.5
pkgrel=1
pkgdesc="A roguelike game with a quest-centric, plot driven structure"
arch=("i686" "x86_64" "armv6h")
conflicts=("adom")
depends=("ncurses5-compat-libs")
url="http://www.adom.de/"
license=('custom: "adom"')

_source_url="http://www.ancardia.com/secure/download/${pkgver}"
source=(LICENSE)
source_i686=(${_source_url}/adom_linux_debian_32_${pkgver}.tar.gz)
source_x86_64=(${_source_url}/adom_linux_debian_64_${pkgver}.tar.gz)
source_armv6h=(${_source_url}/adom_linux_arm_${pkgver}.tar.gz)

sha1sums=('51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
sha1sums_i686=('45a719581af6405ecaa40e4b7a3250a2b27c98a0')
sha1sums_x86_64=('9310f4fd9c68d7586debcb9f0bc136a5f61e323b')
sha1sums_armv6h=('186eec57e47d356b28cdea35ead691d9461801e4')

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom-restricted/LICENSE
}
