# Maintainer: Aliee <bazartroy531@@gmail.com>
# Contributor: John Patrick <john.patrick@gmail.com>

pkgname=neo-candy-icons
_pkgname=neo-candy-icons
pkgver=26.03_01
pkgrel=1
pkgdesc="Neo candy icons"
arch=('any')
url="https://github.com/erikdubois/${_pkgname}"
license=('GPL3')
options=('!strip' '!emptydirs')
# Swapping the dash to an underscore in pkgver makes Arch version parsing happy
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver/_/-}.zip")
sha256sums=('9aa07fb7431dce96a588014aaec18c4ce8d06c75d24dc67096e1cc79be3c2c0b')
provides=("${pkgname}")

package() {
  install -dm 755 "${pkgdir}/usr/share/icons/"

  # When GitHub extracts the zip, the directory name matches the tag name (with dashes)
  cd "${srcdir}/${_pkgname}-${pkgver/_/-}"

  cp -r usr/share/icons/* "${pkgdir}/usr/share/icons/"
}
