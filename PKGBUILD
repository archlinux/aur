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
pkgver=2.3.2
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
sha1sums_i686=('0e565a576ad778b545b3289ed119d96493290c0d')
sha1sums_x86_64=('fd8c22bd5d0f2a3161123a47297dfa0db0773f3d')
sha1sums_armv6h=('746a095cdee271927387299aea0c08100faabd74')

package() {
  cd ${srcdir}/adom

  install -m755 -D adom ${pkgdir}/usr/bin/adom
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom-restricted/LICENSE
}
