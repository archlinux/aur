# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=blender-plugin-edgeflow
pkgver=0.5
pkgrel=1
pkgdesc="Blender tools for working with edgeloops"
url="https://github.com/BenjaminSauder/EdgeFlow"
arch=('any')
license=('GPL3')
depends=('blender' 'python')
provides=('blender-plugin-edgeflow')
conflicts=('blender-plugin-edgeflow')
source=("$url/releases/download/$pkgver/EdgeFlow.zip")
sha256sums=('20baf6f0d95a564ee0759aa7f6344ef9aed8c97958792f125eb19c5353024895')
_blenderver=$(blender -v | head -n1 | cut -f2 -d ' ' | sed 's/\.0$//')

package() {
  install -dm755 "$pkgdir/usr/share/blender/$_blenderver/scripts/addons/edgeflow/"
  install -Dm644 "$srcdir/EdgeFlow"/* "$pkgdir/usr/share/blender/$_blenderver/scripts/addons/edgeflow/"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/EdgeFlow/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
