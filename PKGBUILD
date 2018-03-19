# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>
# Contributor: urbanslug

pkgname=kwin-scripts-tiling
_pkgname=tiling
pkgver=2.0.0
pkgrel=1
pkgdesc="Tiling script for kwin"
arch=('any')
url="https://store.kde.org/content/show.php?content=161151"
license=('GPL2')
depends=('kwin')
source=("https://github.com/faho/kwin-tiling/releases/download/v${pkgver}/tiling-${pkgver}.kwinscript")
sha512sums=('6fa8966bebbe61344a72fca1d8d87099fb9ec91837b3b6f69467478ecf5453cc5fc35ab57025f826c2db748385698936623159af493c70c2c900ce4df6eeb9a6')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${pkgname}"
  cp -r "${srcdir}"/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${pkgname}"
  install -Dm644 "${srcdir}/metadata.desktop" "${pkgdir}/usr/share/kservices5/${pkgname}.desktop"
}
