# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=feeddeck-bin
pkgver=1.1.0
pkgrel=2
pkgdesc='Follow your RSS and Social Media Feeds'
url="https://github.com/feeddeck/feeddeck"
arch=('x86_64')
license=('MIT')
depends=('gtk3')
provides=('feeddeck')
conflicts=('feeddeck')
source=("feeddeck-linux-x86_64$pkgver.tar.gz::https://github.com/feeddeck/feeddeck/releases/download/v$pkgver/feeddeck-linux-x86_64.tar.gz"
        "LICENSE$pkgver::https://github.com/feeddeck/feeddeck/raw/v$pkgver/LICENSE")
sha256sums=('5d1a19c7aec1eeed332711a86b104bd8c223dfec04076c73678d2ff5607b8283'
            '4ed6aa9a25dde43633ded896cdf6a3c03d5ac9e7d46e7ec469d9e905f052a3fe')

package() {
  mkdir -p "$pkgdir/opt/feeddeck" "$pkgdir/usr/bin"
  install -Dm644 LICENSE$pkgver "$pkgdir/usr/share/licenses/feeddeck/LICENSE"
  cd feeddeck-linux-x86_64
  mv data lib feeddeck "$pkgdir/opt/feeddeck"
  install -Dm644 app.feeddeck.feeddeck.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 app.feeddeck.feeddeck.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 app.feeddeck.feeddeck.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  ln -s /opt/feeddeck/feeddeck "$pkgdir/usr/bin"
}
