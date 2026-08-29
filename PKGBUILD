# Maintainer: Mike Ravenblack <0xRavenBlack@github>
pkgname=synemar
pkgver=0.2.0
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
  'bd3ed6a2ddca662e07eae0bcd6d9238aee5de36d0fb49486394e99aa1a377a6d'
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