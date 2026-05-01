# Maintainer: Sneexy <sneexy at synth dot download>

_gitname="plasma-panel-colorizer-islands-separator"
pkgname=plasma6-applets-panel-colorizer-islands-separator-git
pkgver=0.1.0.r0.9d68153
pkgrel=1
pkgdesc="Simple separator widget to create Panel Colorizer widget islands (visible only in Edit Mode)."
arch=(any)
url="https://github.com/luisbocanegra/$_gitname"
license=(GPL-3.0)
depends=('libplasma')
source=("$_gitname"::"git+${url}")
sha256sums=('SKIP')
# this doesn't actually exist yet, but in case I/someone else does package it, probably good to have early on
provides=('plasma6-applets-panel-colorizer-islands-separator')
conflicts=('plasma6-applets-panel-colorizer-islands-separator')

package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/luisbocanegra.panel.colorizer.islands.separator"
  mkdir -p "$_path"
  cp -r "$srcdir/$_gitname/package/contents" "$_path"
  cp -r "$srcdir/$_gitname/package/metadata.json" "$_path"
  install -Dm 644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
