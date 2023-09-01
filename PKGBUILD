# Maintainer: haxibami <contact at haxibami dot net>

pkgname=bloop-desktop-bin
pkgver=0.4.16
pkgrel=1
pkgdesc="A fast code search engine written in Rust"
arch=('x86_64')
url="https://github.com/BloopAI/bloop"
license=('Apache')
depends=('gtk3' 'webkit2gtk' 'qdrant')
provides=('bloop-desktop')
source=(
  "https://github.com/BloopAI/bloop/releases/download/v${pkgver}/bloop_${pkgver}_amd64.deb"
)
sha256sums=('fa93afde16f233e66d35b7f95a86a5667f38c3fcfdc950257c5d9b21d987be17')

package() {
  cd "$srcdir"

  echo " -> Extracting the data.tar.gz..."
  tar -xf data.tar.gz -C "$pkgdir/"

  rm "$pkgdir/usr/bin/qdrant"

  install -dm755 "$pkgdir/usr"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib"
  install -dm755 "$pkgdir/usr/share"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/icons"
  install -dm755 "$pkgdir/usr/share/icons/hicolor"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
}
