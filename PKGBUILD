# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
#Contributor: Alexandre Minoshi (Almin-Soft Group)
pkgname=pacmanxg
pkgver=4.16.3
pkgrel=1
pkgdesc="Yet another GUI for pacman and yaourt. Depends on neither GTK or Qt: only X11"
arch=('i686' 'x86_64')
url="http://almin-soft.ru/index.php?programmy/pacmanxg/tags/pacmanxg"
license=('GPL2')
optdepends=(
  'curl: news and screenshot support' 
  'yaourt: AUR support' 
  'lib32-libxft: anti-aliasing fix for x64' 
  'pkgfile: for searching file(s) from packages' 
  'scrot: for making screenshots' 
)
options=('!strip')
install=${pkgname}.install

if [ "${CARCH}" = 'x86_64' ]; then
  depends=('pacman' 'ssx' 'lib32-libx11' 'lib32-libxrender' 'lib32-gcc-libs')
  source=("pacmanxg_64.tar.bz2::http://almin-soft.fsay.net/data/files/pacmanxg/download.php?get=pacmanxg_64.tar.bz2")
  sha512sums=('d70e9482b911c53d44f2a530875668754f3c47d95168711ac436a83c2560907e95fd4c9bdc32d743351aeb0702336ded273ac0567b46f37ebe7377524cf346b8')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('pacman' 'ssx' 'libx11' 'gcc-libs' 'libxrender')
  source=("pacmanxg.tar.bz2::http://almin-soft.fsay.net/data/files/pacmanxg/download.php?get=pacmanxg.tar.bz2")
  sha512sums=('7ec638aaa398c8069f4cd54f221ac90b6090464b68a09918a6d61b8cc165410e986b3e0cbe89e85b77dd3610903d97da896c8bfd37e79315760cbae9c515d0bc')
fi

package() {
  install -d "${pkgdir}/opt/Almin-Soft/pacmanxg"
  install -Dm755 pacmanxg "${pkgdir}/opt/Almin-Soft/pacmanxg/pacmanxg"
  install -Dm755 dizz.sh "${pkgdir}/opt/Almin-Soft/pacmanxg/dizz.sh"
  install -Dm755 repacman "${pkgdir}/opt/Almin-Soft/pacmanxg/repacman"

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

  install -Dm775 "themes/dusk (Chakra)" "${pkgdir}/opt/Almin-Soft/themes/dusk (Chakra)"
  install -Dm775 "themes/Graybird-like (Bridge)" "${pkgdi}r/opt/Almin-Soft/themes/Graybird-like (Bridge)"
  install -Dm775 "themes/Menda-like (Manjaro 0.10)" "${pkgdir}/opt/Almin-Soft/themes/Menda-like (Manjaro 0.10)"
  install -Dm775 "themes/Munix Frost Light (Antergos)" "${pkgdir}/opt/Almin-Soft/themes/Munix Frost Light (Antergos)"
  install -Dm775 "themes/Oxigen-like (Netrunner)" "${pkgdir}/opt/Almin-Soft/themes/Oxigen-like (Netrunner)"

  install -Dm644 pacmanxg.png "${pkgdir}/usr/share/pixmaps/pacmanxg.png"
  install -Dm644 pacmanxg.desktop "${pkgdir}/usr/share/applications/pacmanxg.desktop"
  install -d "${srcdir}/usr/bin/"
}
