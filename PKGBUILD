# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-blackwell-legacy
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Meet Rosangela Blackwell, an embittered writer who just found out that she is a medium and that it’s her mission."
arch=("i686" "x86_64")
url="http://www.gog.com/game/blackwell_bundle"
license=("custom")
groups=("games")
source=("local://gog_blackwell_legacy_${pkgver}.tar.gz" "gog-blackwell-legacy")
sha256sums=('819bd16896920db3147409fe5e2ea2cb05112ba11f7e292c39dcf255a1882ebe'
            '85772f6c6b12938561a8ae10ac948ff1fd8f5a6dd36ff907f530f3a495c909a0')
depends=(freetype2)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/blackwell-legacy
  cp -r "${srcdir}"/Blackwell\ Legacy/* "${pkgdir}"/opt/gog/blackwell-legacy
  install -Dm644 "${srcdir}"/Blackwell\ Legacy/support/gog-blackwell-legacy-primary.desktop "${pkgdir}"/usr/share/applications/gog-blackwell-legacy.desktop
  install -Dm644 "${srcdir}"/Blackwell\ Legacy/support/gog-blackwell-legacy.png "${pkgdir}"/usr/share/pixmaps/gog-blackwell-legacy.png
  install -Dm644 "${srcdir}"/Blackwell\ Legacy/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-blackwell-legacy" "${pkgdir}/usr/bin/gog-blackwell-legacy"
}
