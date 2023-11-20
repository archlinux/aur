# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=fingrom-bin
pkgver=5.1.3
pkgrel=1
pkgdesc="Platform-agnostic financial accounting application (binary release)"
url="https://github.com/lyskouski/app-finance"
arch=('x86_64')
license=('CCPL:by-nc-nd4')
depends=('gtk3' 'mesa')
conflicts=("fingrom")
provides=("fingrom")
source=("fingrom-$pkgver.tar.gz::$url/releases/download/v$pkgver/fingrom_Linux.tar.gz")
sha256sums=('a47f36036176ce6309a523eaf953803bc47c51378ee154a31224fcbf2996f62b')

package() {
  mkdir -p "$pkgdir/opt/fingrom" "$pkgdir/usr/bin"
  mv data lib fingrom "$pkgdir/opt/fingrom"
  ln -s /opt/fingrom/fingrom -t "$pkgdir/usr/bin"
  install -Dm644 com.tercad.fingrom.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 com.tercad.fingrom.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
