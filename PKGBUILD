# Maintainer: Malah <malah@neuf.fr>
# Contributor: kaptoxic

pkgname=purple-discord-git
pkgver=v0.0.r0.gb17303a
pkgrel=1
pkgdesc="A purple-based (Pidgin) plugin for Discord."
url='https://github.com/EionRobb/purple-discord'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git')
depends=('libpurple' 'json-glib')
source=('pidgin-discord::git+https://github.com/EionRobb/purple-discord.git')
sha512sums=('SKIP')

build() {
  cd "$srcdir/pidgin-discord/"
  make
}

package() {
  cd "$srcdir/pidgin-discord/"
  #installing purple plugin
  install -Dm755 libdiscord.so "$pkgdir/usr/lib/purple-2/libdiscord.so"
  #installing icons
  install -Dm644 discord16.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/16/discord.png"
  install -Dm644 discord22.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/22/discord.png"
  install -Dm644 discord48.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/48/discord.png"
}

