# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=tixati
pkgver=2.16
pkgrel=1
pkgdesc="A simple P2P client that is compatible with the BitTorrent protocol"
arch=('i686' 'x86_64')
url="http://www.tixati.com/"
license=('custom:tixati')
depends=('gtk2' 'hicolor-icon-theme')
optdepends=('gconf: for shell integration')
install=$pkgname.install
source=("LICENSE")
source_i686=("http://tixati.com/download/$pkgname-${pkgver}-${pkgrel}.i686.manualinstall.tar.gz")
source_x86_64=("http://tixati.com/download/$pkgname-${pkgver}-${pkgrel}.x86_64.manualinstall.tar.gz")
sha1sums=('35d7f63a3b0dbf3f8f2bd0a45a7f3c96b453e86b')
sha1sums_i686=('9029b042954ba33ecd9c41a4f89649b3b2c2d342')
sha1sums_x86_64=('db9cd21a0e1b5e57a81183793b4f1398a9bb0643')

package() {
  cd "$srcdir/$pkgname-${pkgver}-${pkgrel}.$CARCH.manualinstall"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
