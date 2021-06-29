# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=moonlight-qt
pkgver=3.1.4
pkgrel=1
pkgdesc='GameStream client for PCs (Windows, Mac, and Linux)'
arch=('x86_64')
license=('GPL')
url='https://moonlight-stream.org'
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg' 'ffmpeg' 'sdl2_ttf')
makedepends=('git')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')
source=("https://github.com/moonlight-stream/${pkgname}/releases/download/v${pkgver}/MoonlightSrc-${pkgver}.tar.gz")
sha256sums=('39e95909c362564b5822e91e5112107c1e0f121d7138db624d9babcb601ec204')

prepare() {
  qmake PREFIX="$pkgdir/usr" moonlight-qt.pro
}

build() {
  make release
}

package() {
  make install
}
