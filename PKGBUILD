# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Alexandre Minoshi (Almin-Soft Group)

pkgname=pacmanxg
pkgver=4.17.0
pkgrel=1
pkgdesc="Yet another GUI for pacman and yaourt. Depends on neither GTK or Qt: only X11"
#arch=('i686' 'x86_64')
arch=('i686')
url="http://almin-soft.ru/index.php?sluzhebnye/pacmanxg/tags/pacmanxg"
license=('GPL2')
optdepends=(
  'curl: news and screenshot support' 
  'yaourt: AUR support' 
  'pkgfile: for searching file(s) from packages' 
  'scrot: for making screenshots'
)
options=('!strip')
install=${pkgname}.install

#if [ "${CARCH}" = 'x86_64' ]; then
#  depends=('pacman' 'ssx' 'lib32-libx11' 'lib32-libxrender' 'lib32-gcc-libs')
#  source=("pacmanxg_64.tar.bz2::http://almin-soft.fsay.net/data/files/pacmanxg/download.php?get=pacmanxg_64.tar.bz2")
#  sha512sums=('d70e9482b911c53d44f2a530875668754f3c47d95168711ac436a83c2560907e95fd4c9bdc32d743351aeb0702336ded273ac0567b46f37ebe7377524cf346b8')
#elif [ "${CARCH}" = 'i686' ]; then
if [ "${CARCH}" = 'i686' ]; then
  depends=('pacman' 'ssx' 'libx11' 'gcc-libs' 'libxrender')
  source=("pacmanxg.tar.bz2::http://almin-soft.ru/data/files/repo/i686/download.php?get=pacmanxg")
  sha512sums=('0dee637f89dffcc19ec35120ccade95a8f9d3c9e391d4d40c679299a2f0c14345e0171313e6229fc51e6263920940f68d916535ccbcce8943f1427f73a55184b')
fi

package() {
  install -d "${pkgdir}/opt/Almin-Soft/pacmanxg"
  install -Dm755 pacmanxg "${pkgdir}/opt/Almin-Soft/pacmanxg/pacmanxg"
  install -Dm755 dizz.sh "${pkgdir}/opt/Almin-Soft/pacmanxg/dizz.sh"
  install -Dm755 repacman "${pkgdir}/opt/Almin-Soft/pacmanxg/repacman"

  # Localization files.
  install -Dm755 langs/de.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/de.lang"
  install -Dm755 langs/en.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/en.lang"
  install -Dm755 langs/es.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/es.lang"
  install -Dm755 langs/fr.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/fr.lang"
  install -Dm755 langs/gl.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/gl.lang"
  install -Dm755 langs/ru.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/ru.lang"
  install -Dm755 langs/el.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/el.lang"
  install -Dm755 langs/pl.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/pl.lang"
  install -Dm755 langs/ca.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/ca.lang"
  install -Dm755 langs/pt-br.lang "${pkgdir}/opt/Almin-Soft/pacmanxg/langs/pt-br.lang"

  # Themes.
  install -Dm775 "themes/dusk (Chakra)" "${pkgdir}/opt/Almin-Soft/themes/dusk (Chakra)"
  install -Dm775 "themes/Graybird-like (Bridge)" "${pkgdi}r/opt/Almin-Soft/themes/Graybird-like (Bridge)"
  install -Dm775 "themes/Menda-like (Manjaro 0.10)" "${pkgdir}/opt/Almin-Soft/themes/Menda-like (Manjaro 0.10)"
  install -Dm775 "themes/Munix Frost Light (Antergos)" "${pkgdir}/opt/Almin-Soft/themes/Munix Frost Light (Antergos)"
  install -Dm775 "themes/Oxigen-like (Netrunner)" "${pkgdir}/opt/Almin-Soft/themes/Oxigen-like (Netrunner)"

  # Application launcher.
  install -Dm644 pacmanxg.png "${pkgdir}/usr/share/pixmaps/pacmanxg.png"
  install -Dm644 pacmanxg.desktop "${pkgdir}/usr/share/applications/pacmanxg.desktop"
  install -d "${srcdir}/usr/bin/"
}
