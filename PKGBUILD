# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=pidgin-opensteamworks
pkgver=1.5.1
pkgrel=1
pkgdesc="A plugin to connect to Steam Friends/Steam IM (purple plugin). "
url=('https://code.google.com/p/pidgin-opensteamworks')
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('nss' 'libgnome-keyring')
depends=('libpurple' 'json-glib')
source=('https://pidgin-opensteamworks.googlecode.com/svn-history/r110/trunk/steam-mobile/releases/steam-mobile-1.5.1.tar.bz2')
sha512sums=('71b83155bbd00bd208c07b797f2021eed33e0aadf321025cf3b2e9bd50399cefd9652b3ee5ea79009876a306e9d07177686861de405355ac8c2a914ebefe8557')

build() {
  cd "$srcdir/"
  make
}

package() {
  cd "$srcdir/"
  #installing purple plugin
  install -Dm755 libsteam.so "$pkgdir/usr/lib/purple-2/libsteam.so"
  #installing icons
  mkdir -p $pkgdir/usr/share/pixmaps/pidgin/protocols
  for size in 16 22 48; do
    install -D steam${size}.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/${size}/steam.png"
  done
}
