# Maintainer: Exidex <exidex@project-gauntlet.dev>
pkgname=gauntlet-bin
pkgver=7
pkgrel=1
pkgdesc='Open-source cross-platform application launcher with React-based plugins'
arch=('x86_64')
url='https://github.com/project-gauntlet/gauntlet'
license=('MPL-2.0')
depends=('libxkbcommon'
         'fontconfig'
         'freetype2'
         'openssl')
optdepends=('libx11: for X11'
            'libxcursor: for X11'
            'libxi: for X11'
            'libxkbcommon-x11: for X11'
            'libxrandr: for X11'
            'wayland: for Wayland')
install="gauntlet.install"
source=("$url/releases/download/v${pkgver}/gauntlet-x86_64-linux.tar.gz")
sha256sums=('8ab4be9d0ec990670febaa8daac0a50bf6582bc18b4277da71599b58937bd9a5')

package() {
   install -Dm755 "$srcdir/gauntlet" "$pkgdir/usr/bin/gauntlet"
   install -Dm644 "$srcdir/gauntlet.desktop" "$pkgdir/usr/share/applications/gauntlet.desktop"
   install -Dm644 "$srcdir/gauntlet.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gauntlet.png"
   install -Dm644 "$srcdir/gauntlet.service" "$pkgdir/usr/lib/systemd/user/gauntlet.service"
}
