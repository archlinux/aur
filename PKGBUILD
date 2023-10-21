# Maintainer: ybenel <root@ybenel.cf>
# Contributor: ybenel <root@ybenel.cf>
pkgname=realneptune
pkgver=1.0.1
pkgrel=3
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
sha256sums=('44b045c049786265838d096d524c0b3e616f4d4f2f954e41d5277276660e3a63')

build() {
  cd "$srcdir"
  tar xf "$srcdir/Neptune.tar.xz"
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir/" install
}
