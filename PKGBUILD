# Maintainer: Sam Simons <mail@samsimons.eu>
# Original Packager: Fabio Lolix Loli <fabio.loli@disroot.org>

pkgname=qt5-webengine-bin
pkgver=5.15.19
pkgrel=4
pkgdesc="Provides support for web applications using the Chromium browser project"
arch=('x86_64')
url="https://www.qt.io"
license=('LGPL3' 'LGPL2.1' 'BSD')
groups=('qt5')
depends=('qt5-webchannel'
         'qt5-location'
         'libxcomposite'
         'libxrandr'
         'pciutils'
         'libxss'
         'libxkbfile'
         'libxdamage'
         'libevent'
         'snappy'
         'nss'
         'libxslt'
         'minizip'
         'ffmpeg'
         'libvpx'
         'libxtst'
         'ttf-font')
optdepends=('pipewire: WebRTC desktop sharing under Wayland')
provides=("qt5-webengine=$pkgver")
conflicts=('qt5-webengine')
source=("qt5-webengine-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst::https://sourceforge.net/projects/fabiololix-os-archive/files/Packages/qt5-webengine-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst/download")
sha256sums=('39614f3e1868c8c623bab1406f3f437dc2a7d49944f8ac54f9bd27574f4c5c7c')

package() {
    find "$srcdir" -mindepth 1 -maxdepth 1 \
         ! -name '.*' \
         ! -name '.BUILDINFO' \
         ! -name '.PKGINFO' \
         ! -name '.MTREE' \
         ! -name '.INSTALL' \
         -exec cp -a {} "$pkgdir/" \;
}
