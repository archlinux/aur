# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3
pkgver=0.0.3
pkgrel=1
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
depends=('alsa-lib' 'glew1.13' 'hicolor-icon-theme' 'libudev.so'
    'ncurses5-compat-libs' 'openal' 'qt5-base' 'vulkan-icd-loader')
makedepends=('p7zip')
options=('!strip')
source=("$pkgname-v$pkgver.AppImage::https://rpcs3.net/cdn/builds/rpcs3-v$pkgver-2017-07-25-ff772dd-7380_linux64.AppImage")
sha256sums=('928e7538bd5a189e4c914a33836bcd9649ae18fb1968bcb188e487f374ecddab')

prepare()
{
    cd "$srcdir"

    7z x -y "$srcdir/$pkgname-v$pkgver.AppImage"
}

package()
{
    cd "$srcdir"

    install -D -m755 usr/bin/rpcs3 "$pkgdir/usr/bin/rpcs3"
    install -D -m644 usr/share/applications/rpcs3.desktop "$pkgdir/usr/share/applications/rpcs3.desktop"
    install -D -m644 usr/share/icons/hicolor/48x48/apps/rpcs3.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/rpcs3.png"
    install -D -m644 usr/share/icons/hicolor/scalable/apps/rpcs3.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rpcs3.svg"
}
