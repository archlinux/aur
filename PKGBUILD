# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3-bin
pkgver=0.0.6
_pkgbuild='7795-d6995f40'
pkgrel=2
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
source=("https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-d6995f40c7eb4f3b2c0c0a1aa5adf0bab55a44e9/rpcs3-v$pkgver-${_pkgbuild}_linux64.AppImage")
sha256sums=('539c7898a57ecb189d4499a81393594c0f82235fd4689a1a1fb07cac274c9af0')

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
