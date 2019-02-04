# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3-bin
pkgver=0.0.6
_pkgbuild='7788-4c593959'
pkgrel=1
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
depends=('glew2.0' 'hicolor-icon-theme' 'libpulse' 'ncurses5-compat-libs'
    'openal' 'qt5-declarative' 'vulkan-icd-loader')
makedepends=('p7zip')
options=('!strip')
replaces=('rpcs3')
provides=('rpcs3')
conflicts=('rpcs3')
source=("https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-4c593959fdad001f08052898d3df4cc420c04d41/rpcs3-v$pkgver-7788-4c593959_linux64.AppImage")
sha256sums=('0B86FBDC369C40EC733CD04BCC1F604A1086E29033C32071A4D8D83721B9BD75')

prepare()
{
    cd "$srcdir"

    7z x -y "$srcdir/rpcs3-v$pkgver-${_pkgbuild}_linux64.AppImage"
}

package()
{
    cd "$srcdir"

    install -D -m755 usr/bin/rpcs3 "$pkgdir/usr/bin/rpcs3"
    install -D -m644 usr/share/applications/rpcs3.desktop "$pkgdir/usr/share/applications/rpcs3.desktop"
    install -D -m644 usr/share/icons/hicolor/48x48/apps/rpcs3.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/rpcs3.png"
    install -D -m644 usr/share/icons/hicolor/scalable/apps/rpcs3.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rpcs3.svg"
}
