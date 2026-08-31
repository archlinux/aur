# Maintainer: Mike Ravenblack <0xRavenBlack@github>
pkgname=synemar
pkgver=0.3.0
pkgrel=1
pkgdesc="Fullscreen music visualizer with waveform + spectrum animation, custom background videos and colors."
arch=('x86_64')
url="https://github.com/0xRavenBlack/synemar"
license=('MIT')
depends=('ffmpeg' 'hicolor-icon-theme')
options=('!strip')
source=(
  "synemar_standalone.tar.gz::https://github.com/0xRavenBlack/synemar/releases/download/v$pkgver/synemar_standalone.tar.gz"
  "$pkgname.desktop::https://github.com/0xRavenBlack/synemar/raw/v$pkgver/packaging/linux/$pkgname.desktop"
  "app.svg::https://github.com/0xRavenBlack/synemar/raw/v$pkgver/app.svg"
)
sha256sums=(
  '39947c7a288d9e9a78c7f4dddea3f9fb54d5c4617a2122b70173461fad442b97'
  '51f19dac3360995275e7f23ee311c873c4ba2ad7a2dd74f408dddd5b656e5f4d'
  '5b60259f69de112dcde62ded6b25216c11895e40f05015d06397b1dc614732c2'
)

package() {
  install -dm755 "$pkgdir/opt/Synemar"
  tar -xzf "$srcdir/synemar_standalone.tar.gz" -C "$pkgdir/opt/Synemar"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -dm755 "$pkgdir/usr/bin"
  ln -s ../opt/Synemar/$pkgname "$pkgdir/usr/bin/$pkgname"
}