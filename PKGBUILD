# Maintainer: Philip Müller <philm[at]manjaro[dot]org>
# Developer: Filipe Marques <eagle[dot]software3[at]gmail[dot]com>

pkgname=vicky
pkgver=1.6.2
pkgrel=1
pkgdesc="GUI program that converts video files to sound files using ffmpeg"
arch=('i686' 'x86_64')
url="https://github.com/filipe-marques/vicky"
license=('GPL')
depends=('ffmpeg' 'qt5-base')
makedepends=('qt5-tools')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('9bafae05a128c1fe3ace4fe8da9049d8')

build() {
  cd $srcdir/vicky-$pkgname-$pkgver
  qmake-qt5 vicky.pro
  make
}

package() {
  cd $srcdir/vicky-$pkgname-$pkgver
  #make install INSTALL_ROOT=$pkgdir

  install -Dm755 "Vicky" "${pkgdir}/usr/bin/vicky"
  install -Dm644 "vicky.desktop" "${pkgdir}/usr/share/applications/vicky.desktop"
  install -Dm644 "resource/icons/vicky24.png" "${pkgdir}/usr/share/icons/vicky.png"
  install -Dm644 "resource/icons/vicky24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/vicky.png"
  install -Dm644 "resource/icons/vicky128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vicky.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/vicky/LICENSE"
}
