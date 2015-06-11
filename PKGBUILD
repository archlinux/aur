# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-rise-of-the-triad-dark-war
pkgver=1.0.0.7
pkgrel=1
pkgdesc="Old-school first person shooter with an arcade feel."
arch=("i686" "x86_64")
url="http://www.gog.com/game/rise_of_the_triad__dark_war"
license=("custom")
groups=("games")
source=("local://gog_rise_of_the_triad_dark_war_${pkgver}.tar.gz" "gog-rise-of-the-triad-dark-war")
sha256sums=('100753a91fd212f367620c49fb26c36e382e96677ec504245a050235c7f22e6e'
            'd74bb4ed35d23c4a788fca6cf14d4eb21a0a39e7e25cbc6d943fe1658bd7c343')
depends=(libpng12 unionfs-fuse)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/rise-of-the-triad-dark-war
  cp -r "${srcdir}"/Rise\ of\ the\ Triad\ Dark\ War/* "${pkgdir}"/opt/gog/rise-of-the-triad-dark-war
  install -Dm644 "${srcdir}"/Rise\ of\ the\ Triad\ Dark\ War/support/gog-rise-of-the-triad-dark-war-primary.desktop "${pkgdir}"/usr/share/applications/gog-rise-of-the-triad-dark-war.desktop
  install -Dm644 "${srcdir}"/Rise\ of\ the\ Triad\ Dark\ War/support/gog-rise-of-the-triad-dark-war-1.desktop "${pkgdir}"/usr/share/applications/gog-rise-of-the-triad-dark-war-server.desktop
  install -Dm644 "${srcdir}"/Rise\ of\ the\ Triad\ Dark\ War/support/gog-rise-of-the-triad-dark-war-2.desktop "${pkgdir}"/usr/share/applications/gog-rise-of-the-triad-dark-war-client.desktop
  install -Dm644 "${srcdir}"/Rise\ of\ the\ Triad\ Dark\ War/support/gog-rise-of-the-triad-dark-war.png "${pkgdir}"/usr/share/pixmaps/gog-rise-of-the-triad-dark-war.png
  install -Dm644 "${srcdir}"/Rise\ of\ the\ Triad\ Dark\ War/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-rise-of-the-triad-dark-war" "${pkgdir}/usr/bin/gog-rise-of-the-triad-dark-war"
}
 
