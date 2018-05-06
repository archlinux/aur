pkgname='discord-updater'
pkgver='1.0.0'
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord')
conflicts=('discord')
license=('custom')
depends=('gtk3' 'gconf' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'libc++' 'xdg-utils' 'xterm' 'curl')
optdepends=(
  'libpulse: For pulseaudio support'
  'noto-fonts-emoji: Google font for emoji support.'
  'ttf-symbola: Font for emoji support.'
)

source=(
  'discord.sh'
  'discord.desktop'
  'discord.png'
)

sha256sums=(
  '7aa198b1e0caf352dc30bdbf474846399b3a245cbf6d235db5ac66327758040e'
  '6d2adfd530398b012c805d4721f33f197f839ebda55c2cbc28d06a8addb8e5a9'
  '21742e243c6c7a93529f4bf1d34571c8d78a29e946057c54b362b405907e1b6b'
)

package() {
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/pixmaps/

  install -m755 -T "$srcdir"/discord.sh      "$pkgdir"/usr/bin/discord
  install -m644    "$srcdir"/discord.png     "$pkgdir"/usr/share/pixmaps/discord.png
  install -m644    "$srcdir"/discord.desktop "$pkgdir"/usr/share/applications
}
