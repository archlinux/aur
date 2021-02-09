# Maintainer: Carson Rueter <roachh at proton mail dot com>

pkgname='discord-qt-appimage'
_pkgname='DiscordQt'
pkgdesc='Discord client powered by Node.JS and Qt Widgets.'
url='https://github.com/ruslang02/discord-qt'
license=('GPL')
pkgver=0.5.1
pkgrel=1
_bin="DiscordQt-v$pkgver-linux-x64.AppImage"
source=("https://github.com/ruslang02/discord-qt/releases/download/v$pkgver/$_bin"
        "discord-qt.desktop"
        "discord-qt.png")
md5sums=('97e5e456818d8eccfb4a8ffd03c5a532'
         'c1afce90bb8f9bd26f13315fefb2463e'
         'c2bde1f15baed51a37001fc8ee08316f')
provides=('discord-qt')
conflicts=('discord-qt')
depends=('qt5-base' 'qt5-svg' 'libbsd' 'libgcrypt' 'lzo')
arch=('x86_64')
options=('!strip')

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/discord-qt/${_bin}"
  install -Dm644 "${srcdir}/discord-qt.desktop" "${pkgdir}/usr/share/applications/discord-qt.desktop"
  install -Dm644 "${srcdir}/discord-qt.png" "${pkgdir}/opt/discord-qt/discord-qt.png"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "${pkgdir}/opt/discord-qt/${_bin}" "${pkgdir}/usr/bin/Discord-Qt"
}
