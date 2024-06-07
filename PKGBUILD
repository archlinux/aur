# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>
# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=moonlight-qt
pkgver=6.0.0
pkgrel=4
pkgdesc='GameStream client for PCs (Windows, Mac, and Linux)'
arch=('x86_64')
license=('GPL-3.0-or-later')
url='https://moonlight-stream.org'
depends=('qt6-base' 'qt5-quickcontrols2' 'qt5-svg' 'ffmpeg' 'sdl2_ttf' 'vulkan-headers' 'vulkan-tools')
makedepends=('git')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')
source=("https://github.com/moonlight-stream/${pkgname}/releases/download/v${pkgver}/MoonlightSrc-${pkgver}.tar.gz")
sha256sums=('07655598f82d607dbf20b484a45a46db2496764a4bbb7a18e66f066564a83b89')

prepare() {
  qmake PREFIX="$pkgdir/usr" moonlight-qt.pro
}

build() {
  make release
}

package() {
  make install
}
