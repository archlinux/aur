# Maintainer: Maciej <macrionyn@proton.me>

pkgname=sotto-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Local speech-to-text transcription for Linux/Wayland using Whisper'
arch=('x86_64')
url="https://github.com/Maciejonos/sotto"
license=('MIT')
depends=('gtk4' 'libadwaita' 'pipewire' 'wl-clipboard' 'wtype' 'vulkan-icd-loader')
provides=('sotto')
conflicts=('sotto')
source=("sotto-$pkgver::$url/releases/download/v$pkgver/sotto"
  "sotto.desktop::$url/raw/v$pkgver/data/sotto.desktop"
  "sotto.png::$url/raw/v$pkgver/data/sotto.png"
  "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
sha256sums=('94ebc846d7aff1418ff1a8a5c3dcfd01502405f609d97ec020f937056b342d10'
            'a88deec8f0a88c90c75256b518f41f9e5e97238d558396044c14a9799e36db51'
            'af6d19bea600995abe5a1330c4ad018db7f2f4d2ee0a23b30a0a8ddc4b320a6b'
            '73f22f02e13930fb91fd8dea360679549e2184ca2e64bb5543b87f1c09cc4e2c')

package() {
  install -Dm755 "sotto-$pkgver" "$pkgdir/usr/bin/sotto"
  install -Dm644 sotto.desktop "$pkgdir/usr/share/applications/sotto.desktop"
  install -Dm644 sotto.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/sotto.png"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
