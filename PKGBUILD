# Maintainer: Rezn1r <rezn1r@proton.me>

pkgname=bridge-core-bin
pkgver=2.7.54
pkgrel=1
pkgdesc="bridge. The IDE for Minecraft Add-Ons. Light-weight, powerful, easy to use!"
arch=('x86_64')
url="https://bridge-core.app/"
license=('GPL3')
options=('!debug')
depends=(
  'gtk3'
  'webkit2gtk'
  'libsoup'
)
provides=(
  'bridge-core'
)
source=(
  "https://github.com/bridge-core/editor/releases/download/v${pkgver}/bridge_${pkgver}_amd64.deb"
)
sha256sums=(
  '19f4bf03e66ed3797e9fc6b72cb08d3dd3175b797c4893850c8454d9fc486cfe'
)

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

  mv "$pkgdir/usr/bin/bridge" "$pkgdir/usr/bin/bridge-core"
  sed -i 's|^Exec=.*|Exec=bridge-core|' \
    "$pkgdir/usr/share/applications/bridge.desktop"
}