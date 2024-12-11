# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=feeddeck-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='Follow your RSS and Social Media Feeds'
url="https://github.com/feeddeck/feeddeck"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gtk3')
provides=('feeddeck')
conflicts=('feeddeck')
source=("LICENSE2024::$url/raw/63f7ab7bf66ded2ef538be20803b44966733de1f/LICENSE") # 1.4.1
sha256sums=('ed61fffd00c7d32bcbdfbe95e2b2c834ef3b2816b15db3bb87ab66939e7d4902')
sha256sums_x86_64=('2b6e45d2f89ae814fd5c3c442dc12bfe2e73706280d3c579ba4683d1ab0b89a9')
sha256sums_aarch64=('SKIP')
source_x86_64=("feeddeck-linux-$pkgver.tar.gz::$url/releases/download/v$pkgver/feeddeck-linux-x86_64.tar.gz")
source_aarch64=("feeddeck-linux-$pkgver.tar.gz::$url/releases/download/v$pkgver/feeddeck-linux-arm64.tar.gz")

package() {
  mkdir -p "$pkgdir/opt/feeddeck" "$pkgdir/usr/bin"
  install -Dm644 LICENSE2024 "$pkgdir/usr/share/licenses/feeddeck/LICENSE"
  cd feeddeck-linux-x86_64
  mv data lib feeddeck "$pkgdir/opt/feeddeck"
  install -Dm644 app.feeddeck.feeddeck.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 app.feeddeck.feeddeck.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 app.feeddeck.feeddeck.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  ln -s /opt/feeddeck/feeddeck "$pkgdir/usr/bin"
}
