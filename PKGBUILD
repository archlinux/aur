# Maintainer : Corey Wood <corky@corky.me.uk>

pkgname=gog-democracy-3
pkgver=1.0.0.2
pkgrel=1
pkgdesc="Have you ever wanted to be President? Or Prime Minister? Now you can."
arch=("i686" "x86_64")
url="http://www.gog.com/game/democracy_3"
license=("custom")
groups=("games")
source=("local://gog_democracy_3_${pkgver}.tar.gz" "gog-democracy-3")
sha256sums=('004b6b6c8973e33d9f0c7cb8b43cf59c732e98aa47fb862e6964fac2a5a5acae'
            '3d8af8a5ed6be5f62e4aaaf04587cada07085cb5f49cb95bad1e9573e1c22cc9')
depends=(freetype2 unionfs-fuse)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/democracy-3
  cp -r "${srcdir}"/Democracy\ 3/* "${pkgdir}"/opt/gog/democracy-3
  install -Dm644 "${srcdir}"/Democracy\ 3/support/gog-democracy-3-primary.desktop "${pkgdir}"/usr/share/applications/gog-democracy-3.desktop
  install -Dm644 "${srcdir}"/Democracy\ 3/support/gog-democracy-3.png "${pkgdir}"/usr/share/pixmaps/gog-democracy-3.png
  install -Dm644 "${srcdir}"/Democracy\ 3/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-democracy-3" "${pkgdir}/usr/bin/gog-democracy-3"
}
