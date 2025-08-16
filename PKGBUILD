# Maintainer: Exidex <exidex@project-gauntlet.dev>
pkgname=gauntlet-bin
pkgver=21
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
sha256sums=('170603340c2ffb145d8a70844004b91b2e3fc7aef6422a50ea4d7c5a6f6e5ed8')

package() {
   install -Dm755 "$srcdir/gauntlet" "$pkgdir/usr/bin/gauntlet"
   install -Dm644 "$srcdir/gauntlet.desktop" "$pkgdir/usr/share/applications/gauntlet.desktop"
   install -Dm644 "$srcdir/gauntlet.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gauntlet.png"
   install -Dm644 "$srcdir/gauntlet.service" "$pkgdir/usr/lib/systemd/user/gauntlet.service"
}
