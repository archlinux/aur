# Maintainer: huza <huzaifahasif3@gmail.com>
pkgname=datacraft-bin
pkgver=0.16.0
pkgrel=1
pkgdesc='Lightweight desktop client for SQL databases (precompiled release)'
arch=('x86_64' 'aarch64')
url='https://github.com/javy-fernandez/datacraft'
license=('MIT' 'Apache-2.0')
options=('!strip' '!debug')
depends=('dbus' 'sqlite' 'vulkan-icd-loader')
optdepends=(
  'gnome-keyring: store database passwords in the Secret Service'
  'kwallet: store database passwords in the Secret Service'
)
provides=('datacraft')
conflicts=('datacraft-git')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/javy-fernandez/datacraft/releases/download/v$pkgver/DataCraft-$pkgver-linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/javy-fernandez/datacraft/releases/download/v$pkgver/DataCraft-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('9235271e9a15bcd867d355eb03cc4a88cc373ebfca033c410a76a113fee0221d')
sha256sums_aarch64=('a3934168b5a60c2c7a3d99ec9ed2a77899da77f25e3200a47a0dcbbd63d971d9')

package() {
  install -Dm755 "$srcdir/DataCraft/datacraft" "$pkgdir/usr/bin/datacraft"
  install -Dm644 "$srcdir/DataCraft/datacraft.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/datacraft.png"
  install -Dm644 "$srcdir/DataCraft/datacraft.desktop" "$pkgdir/usr/share/applications/datacraft.desktop"
  install -Dm644 "$srcdir/DataCraft/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "$srcdir/DataCraft/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
