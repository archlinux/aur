pkgname='discord-canary-updater'
pkgver='1.0.0'
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord')
conflicts=('discord-canary')
license=('custom')
depends=('gtk3' 'gconf' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'libc++' 'xdg-utils' 'xterm' 'curl')
optdepends=(
  'libpulse: For pulseaudio support'
  'noto-fonts-emoji: Google font for emoji support.'
  'ttf-symbola: Font for emoji support.'
)

source=(
  'discord-canary.sh'
  'discord-canary.desktop'
  'discord-canary.png'
)

sha256sums=(
  '04a20be856bb6d95db364680ac594a6247a30ccfa1ea1c57be40aae461397090'
  'e554dbc5d8b4e6753e9a921336508d051af575c2d77b96be9e3f72a5f4ca837a'
  '2ecdfa8a65dad1945a9b6be43aab7684d3fd27b18c26d45e3c5fc75fd8c7b509'
)

package() {
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/pixmaps/

  install -m755 -T "$srcdir"/discord-canary.sh      "$pkgdir"/usr/bin/discord-canary
  install -m644    "$srcdir"/discord-canary.png     "$pkgdir"/usr/share/pixmaps/discord-canary.png
  install -m644    "$srcdir"/discord-canary.desktop "$pkgdir"/usr/share/applications
}
