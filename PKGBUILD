# Maintainer: Kévin Unger <kevin.unger@proton.me>
# Template — 0.34.1 and 812e70eae0cd9015490d6e040f51e15b1868536fb98cb8dad328d998eefe267d are substituted by .github/workflows/aur.yml
# (or scripts/aur-publish.sh) before pushing to the AUR.
pkgname=blunderdb-bin
_appname=blunderdb
pkgver=0.34.1
pkgrel=1
pkgdesc="Backgammon blunder analysis tool (precompiled, webkit2gtk-4.1)"
arch=('x86_64')
url="https://github.com/kevung/blunderDB"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('blunderdb')
conflicts=('blunderdb')
options=('!strip')
source=("blunderdb-${pkgver}.tar.gz::https://github.com/kevung/blunderDB/releases/download/${pkgver}/blunderDB-linux-webkit2gtk-4.1-${pkgver}.tar.gz")
sha256sums=('812e70eae0cd9015490d6e040f51e15b1868536fb98cb8dad328d998eefe267d')

_srcdir="blunderDB-linux-webkit2gtk-4.1-${pkgver}"

package() {
  install -Dm755 "${_srcdir}/blunderDB"        "${pkgdir}/usr/bin/blunderDB"
  install -Dm644 "${_srcdir}/blunderdb.desktop" "${pkgdir}/usr/share/applications/blunderdb.desktop"
  install -Dm644 "${_srcdir}/blunderdb-256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/blunderdb.png"
  install -Dm644 "${_srcdir}/io.github.kevung.blunderDB.metainfo.xml" \
                 "${pkgdir}/usr/share/metainfo/io.github.kevung.blunderDB.metainfo.xml"
  install -Dm644 "${_srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
