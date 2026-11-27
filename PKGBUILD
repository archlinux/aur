# Maintainer: huza <huzaifahasif3@gmail.com>
pkgname=datacraft-bin
pkgver=0.19.0
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
sha256sums_x86_64=('6c849d5b67e7fa27b5d71d0aed9b3ebd943c8d687b6f96d8bdb2c68d2165c53d')
sha256sums_aarch64=('d2c4d7cad6bdac0a2caf8c55579821c827bac097f2dbf5bce7bcb041079c8c83')

package() {
  install -Dm755 "$srcdir/DataCraft/datacraft" "$pkgdir/usr/bin/datacraft"
  install -Dm644 "$srcdir/DataCraft/datacraft.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/datacraft.png"
  install -Dm644 "$srcdir/DataCraft/datacraft.desktop" "$pkgdir/usr/share/applications/datacraft.desktop"
  install -Dm644 "$srcdir/DataCraft/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "$srcdir/DataCraft/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
