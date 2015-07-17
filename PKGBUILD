# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-blackwell-unbound
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Meet Rosangela Blackwell, an embittered writer who just found out that she is a medium and that it’s her mission."
arch=("i686" "x86_64")
url="http://www.gog.com/game/blackwell_bundle"
license=("custom")
groups=("games")
source=("local://gog_blackwell_unbound_${pkgver}.tar.gz" "gog-blackwell-unbound")
sha256sums=('daf65c58c2db0fa0de4ee36b55826a04ad545c8f84fa7e1a41788fee92d465b9'
            '75d0b04dc0ec4aafa98d5a48577f33f1b9a95041137e5bfc23b551bdfefbf7b2')
depends=(freetype2)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/blackwell-unbound
  cp -r "${srcdir}"/Blackwell\ Unbound/* "${pkgdir}"/opt/gog/blackwell-unbound
  install -Dm644 "${srcdir}"/Blackwell\ Unbound/support/gog-blackwell-unbound-primary.desktop "${pkgdir}"/usr/share/applications/gog-blackwell-unbound.desktop
  install -Dm644 "${srcdir}"/Blackwell\ Unbound/support/gog-blackwell-unbound.png "${pkgdir}"/usr/share/pixmaps/gog-blackwell-unbound.png
  install -Dm644 "${srcdir}"/Blackwell\ Unbound/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-blackwell-unbound" "${pkgdir}/usr/bin/gog-blackwell-unbound"
}
