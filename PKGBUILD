# Maintainer: Philip Müller <philm[at]manjaro[dot]org>
# Developer: Filipe Marques <eagle[dot]software3[at]gmail[dot]com>

pkgname=checkhash
pkgver=1.0.4
pkgrel=3
pkgdesc="GUI wrapper of GNU Coreutils sha1sum"
arch=('i686' 'x86_64')
url="https://github.com/filipe-marques/check-hash"
license=('GPL')
depends=('coreutils' 'qt5-base')
makedepends=('qt5-tools')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('f7a037816fc770788ee491043de2ffd3')
#524910888a0c8be75dd5a75c4fdda13014d9dfd30ae8edb50bfa10bf41991e7e
build() {
  cd $srcdir/check-hash-$pkgname-$pkgver
  qmake-qt5 checkhash.pro
  make
}

package() {
  cd $srcdir/check-hash-$pkgname-$pkgver
  #make install INSTALL_ROOT=$pkgdir

  install -Dm755 "Check_Hash" "${pkgdir}/usr/bin/checkhash"
  install -Dm644 "checkhash.desktop" "${pkgdir}/usr/share/applications/checkhash.desktop"
  install -Dm644 "resource/icons/ch24.png" "${pkgdir}/usr/share/icons/checkhash.png"
  install -Dm644 "resource/icons/ch24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/checkhash.png"
  install -Dm644 "resource/icons/ch128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/checkhash.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/checkhash/LICENSE"
}
