# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=fingrom-bin
pkgver=5.1.2
pkgrel=1
pkgdesc="Platform-agnostic financial accounting application (binary release)"
url="https://github.com/lyskouski/app-finance"
arch=('x86_64')
license=('CCPL:by-nc-nd4')
depends=('gtk3' 'mesa')
conflicts=("fingrom")
provides=("fingrom")
source=("fingrom-$pkgver.tar.gz::$url/releases/download/v$pkgver/fingrom_Linux.tar.gz")
sha256sums=('871de8f7272b91b9bc351c6efaea41b4aa6bf5573a63b25934811d3af1671be5')

package() {
  mkdir -p "$pkgdir/opt/fingrom" "$pkgdir/usr/bin"
  mv data lib fingrom "$pkgdir/opt/fingrom"
  ln -s /opt/fingrom/fingrom -t "$pkgdir/usr/bin"
  install -Dm644 com.tercad.fingrom.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 com.tercad.fingrom.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
