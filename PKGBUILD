# Maintainer: xylosper <darklin20@gmail.com>
# Contributor: willemw <willemw12@gmail.com>

pkgname=bomi
pkgver=0.9.11
pkgrel=1
pkgdesc="Powerful and easy-to-use GUI multimedia player based on mpv"
arch=('i686' 'x86_64')
url="http://$pkgname-player.github.io"
license=('GPL')
provides=('cmplayer')
install=$pkgname.install
depends=('qt5-base' 'qt5-declarative' 'qt5-x11extras' 'qt5-quickcontrols' 'qt5-svg'
         'libdvdread' 'libdvdnav' 'libcdio-paranoia' 'libcdio' 'smbclient'
         'alsa-lib' 'libpulse' 'jack' 'libchardet' 'libbluray'
         'libva' 'libvdpau' 'libgl' 'fribidi' 'libass' 'ffmpeg')
makedepends=('mesa' 'gcc' 'pkg-config' 'python' 'qt5-tools')
optdepends=('libva-intel-driver: hardware acceleration support for Intel GPU'
            'mesa-vdpau: hardware acceleration support for AMD/NVIDIA opensource driver'
            'youtube-dl: streaming website support including YouTube'
            'libaacs: AACS decryption for Blu-ray support'
            'libbdplus: BD+ decryption for Blu-ray support')
source=($pkgname-$pkgver.tar.gz::https://github.com/xylosper/bomi/archive/v$pkgver.tar.gz)
md5sums=('543c592f588c68d6f0c3cf254c288f58')
#options=(debug !strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DEST_DIR=$pkgdir install
}
