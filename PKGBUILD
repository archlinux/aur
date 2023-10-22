# Maintainer: ybenel <root@ybenel.cf>
# Contributor: ybenel <root@ybenel.cf>
pkgname=realneptune
pkgver=1.0.2
pkgrel=1
pkgdesc="Neptune a superfast mechanical keyboard sound app"
arch=('x86_64')
url="https://github.com/M1ndo/Neptune"
license=('AGPL3')
makedepends=('make')
depends=('libx11' 'libxtst' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'alsa-lib'
         'libayatana-appindicator' 'libayatana-indicator'
         'ayatana-ido' 'libdbusmenu-glib' 'gtk3'
         'pango' 'harfbuzz' 'at-spi2-core' 'cairo'
         'gdk-pixbuf2' 'libglvnd' 'libxrandr'
         'libxxf86vm' 'libxi' 'libxcursor' 'libxinerama')

source=("https://github.com/M1ndo/Neptune/releases/download/v$pkgver/Neptune.tar.xz")
sha256sums=('8ad50579e73a687e0f8ea777983b25dcc9227ed4e5d4023447c4a3da856a1316')

build() {
  cd "$srcdir"
  tar xf "$srcdir/Neptune.tar.xz"
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir/" install
}
