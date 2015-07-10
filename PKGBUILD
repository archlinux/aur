# Maintainer : Suntorvic <suntorvic at free dot fr>

pkgname=gog-to-the-moon
pkgver=1.0.0.1
pkgrel=2
pkgdesc="To The Moon follows Dr. Rosalene and Dr. Watts' attempt to fulfill the wishes of a dying elderly man, Johnny. In their attempt to do so, they travel deep through the man's memories, unfolding his curious life story before their eyes."
pkbase=gog-to-the-moon
arch=("i686" "x86_64")
url="http://www.gog.com/game/to_the_moon"
license=("custom")
groups=("games")
source=("local://gog_to_the_moon_${pkgver}.tar.gz" 
"gog-to-the-moon")
sha256sums=('668428a4e0d8886bda3093dec18e851618f8d555c942c6174ac85379e26e0fad'
            '7b0eb82561509a1b05790b77d59a90fd6e7d58541ea46094273338c1f9dd1e29')
depends=(libgl libx11 libxext desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/to-the-moon
  cp -r "${srcdir}"/To\ The\ Moon/* "${pkgdir}"/opt/gog/to-the-moon
  install -Dm644 "${srcdir}"/To\ The\ Moon/support/gog-to-the-moon-primary.desktop "${pkgdir}"/usr/share/applications/gog-to-the-moon.desktop
  install -Dm644 "${srcdir}"/To\ The\ Moon/support/gog-to-the-moon.png "${pkgdir}"/usr/share/pixmaps/gog-to-the-moon.png
  install -Dm644 "${srcdir}"/To\ The\ Moon/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-to-the-moon" "${pkgdir}/usr/bin/gog-to-the-moon"
} 