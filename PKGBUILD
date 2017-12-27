# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3-bin
pkgver=0.0.4
_pkgbuild='2017-12-25-3cf0fb6-9235'
pkgrel=3
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
depends=('alsa-lib' 'glew1.13' 'hicolor-icon-theme' 'libudev.so'
    'ncurses5-compat-libs' 'openal' 'qt5-base' 'vulkan-icd-loader')
makedepends=('p7zip')
options=('!strip')
replaces=('rpcs3')
provides=('rpcs3')
conflicts=('rpcs3')
source=("https://rpcs3.net/cdn/builds/rpcs3-v$pkgver-${_pkgbuild}_linux64.AppImage")
sha256sums=('d49fc1f2adf6954467c4fe9263ae109611ac595f4afce92f7bcfecb2104fa5a8')

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
