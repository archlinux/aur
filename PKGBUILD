# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=feeddeck-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Follow your RSS and Social Media Feeds'
url="https://github.com/feeddeck/feeddeck"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gtk3')
provides=('feeddeck')
conflicts=('feeddeck')
source=("LICENSE$pkgver::$url/raw/v$pkgver/LICENSE")
sha256sums=('SKIP')
source_x86_64=("feeddeck-linux-$pkgver.tar.gz::$url/releases/download/v$pkgver/feeddeck-linux-x86_64.tar.gz")
sha256sums_x86_64=('e342ab342a4eda945fb43419218acc9e3b663c1f86d34b6c1898b69e25e77d51')
source_aarch64=("feeddeck-linux-$pkgver.tar.gz::$url/releases/download/v$pkgver/feeddeck-linux-arm64.tar.gz")
sha256sums_aarch64=('SKIP')

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
