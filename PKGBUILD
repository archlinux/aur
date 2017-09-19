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
pkgver=74
pkgrel=1
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

sha1sums=('51d28fe3f0420cd354113fd7ceb2a1a7abf1b069')
sha1sums_i686=('7ca3de84c615f2edfcb74cbb6c7a5d18079f2bc8')
sha1sums_x86_64=('e8123ff74576b91260b0bcd043b2f7728828c496')
sha1sums_armv6h=('a67ffe11835f44bc8f97459a152cf591a4687637')

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom-restricted/LICENSE
}
