# Maintainer: ybenel <root@ybenel.cf>
# Contributor: ybenel <root@ybenel.cf>
pkgname=realneptune-cli
pkgver=1.0.2
pkgrel=1
pkgdesc="Neptune a superfast mechanical keyboard sound app (CLI)"
arch=('x86_64')
url="https://github.com/M1ndo/Neptune"
license=('AGPL3')
depends=('libx11' 'libxtst'
         'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'alsa-lib'
         'libayatana-appindicator' 'libayatana-indicator'
         'ayatana-ido' 'libdbusmenu-glib' 'gtk3'
         'pango' 'harfbuzz' 'at-spi2-core' 'cairo'
         'gdk-pixbuf2' 'libxrandr' 'libxcursor' 'libxinerama')

source=("https://github.com/M1ndo/Neptune/releases/download/v$pkgver/Neptune-Cli")
sha256sums=('2db0ccfcbaffafdc2e018579f72b197e960437d16dc0c050fd02d42f455dcf9d')

prepare() {
  # Remove existing symbolic link
  rm "$srcdir/Neptune-Cli"
  # Copy the actual file to the source directory
  cp "$(readlink -f $startdir)/Neptune-Cli" "$srcdir/Neptune-Cli"
}

package() {
  install -Dm755 "$srcdir/Neptune-Cli" "$pkgdir/usr/bin/Neptune"
}
