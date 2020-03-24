# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=surfn-icons-git
pkgver=20.3
pkgrel=4
_destname="/usr/share/icons/"
pkgdesc="Surfn is a colourful icon theme."
arch=('any')
url="https://github.com/erikdubois/Surfn"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
options=(!strip !emptydirs)
source=('Surfn::git+https://github.com/erikdubois/Surfn.git')
sha256sums=('SKIP')

package() {
  find ${srcdir}/Surfn/surfn-icons -type f -name "*.sh" -exec chmod 644 '{}' \;
  install -dm 755 ${pkgdir}${_destname}
  cp -r ${srcdir}/Surfn/surfn-icons/* ${pkgdir}${_destname}
}