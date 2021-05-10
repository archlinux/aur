# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=moonlight-qt
pkgver=3.1.3
pkgrel=1
pkgdesc='GameStream client for PCs (Windows, Mac, and Linux)'
arch=('x86_64')
license=('GPL')
url='https://moonlight-stream.org'
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg' 'ffmpeg' 'sdl2_ttf')
makedepends=('git')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')
source=("https://github.com/moonlight-stream/${pkgname}/releases/download/v${pkgver}/MoonlightSrc-${pkgver}.tar.gz")
sha256sums=('bb69465161d736474d5b1a697fbae03e17be0ffd08bdea6937b7ef11592589f7')

prepare() {
  qmake PREFIX="$pkgdir/usr" moonlight-qt.pro
}

build() {
  make release
}

package() {
  make install
}
