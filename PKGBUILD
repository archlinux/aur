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
pkgver=69
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

sha1sums=("51d28fe3f0420cd354113fd7ceb2a1a7abf1b069")
sha1sums_i686=("8177f8f7fd3b86df64a9972ed7cd2e57c4940a86")
sha1sums_x86_64=("5fd4094363a8819385becbfb409eb73a5815a1f9")
sha1sums_armv6h=("8299ff6ba729b09e720768e61fad2ebbbea3dd03")

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom-restricted/LICENSE
}
