# Maintainer: Kévin Unger <kevin.unger@proton.me>
# Template — 0.33.0 and cd3da8b42ba8ad498c355afa3d625dc56e69409d28e0fa3fab471e3d0be7ffce are substituted by .github/workflows/aur.yml
# (or scripts/aur-publish.sh) before pushing to the AUR.
pkgname=blunderdb-bin
_appname=blunderdb
pkgver=0.33.0
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
sha256sums=('cd3da8b42ba8ad498c355afa3d625dc56e69409d28e0fa3fab471e3d0be7ffce')

_srcdir="blunderDB-linux-webkit2gtk-4.1-${pkgver}"

package() {
  install -Dm755 "${_srcdir}/blunderDB"        "${pkgdir}/usr/bin/blunderDB"
  install -Dm644 "${_srcdir}/blunderdb.desktop" "${pkgdir}/usr/share/applications/blunderdb.desktop"
  install -Dm644 "${_srcdir}/blunderdb-256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/blunderdb.png"
  install -Dm644 "${_srcdir}/io.github.kevung.blunderDB.metainfo.xml" \
                 "${pkgdir}/usr/share/metainfo/io.github.kevung.blunderDB.metainfo.xml"
  install -Dm644 "${_srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
