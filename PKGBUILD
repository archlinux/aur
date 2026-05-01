# Maintainer: Sneexy <sneexy at synth dot download>

_gitname="plasma-advanced-separator"
_appletid="luisbocanegra.advanced_separator"
pkgname=plasma6-applets-advanced-separator-git
pkgver=0.1.1.r0.4c50161
pkgrel=1
pkgdesc="Customizable separator widget for the KDE Plasma Desktop"
arch=(any)
url="https://github.com/luisbocanegra/$_gitname"
license=(GPL-3.0)
depends=('libplasma')
source=("$_gitname"::"git+${url}")
sha256sums=('SKIP')
# this doesn't actually exist yet, but in case I/someone else does package it, probably good to have early on
provides=('plasma6-applets-advanced-separator')
conflicts=('plasma6-applets-advanced-separator')

package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/$_appletid"
  mkdir -p "$_path"
  cp -r "$srcdir/$_gitname/package/contents" "$_path"
  cp -r "$srcdir/$_gitname/package/translate" "$_path"
  cp -r "$srcdir/$_gitname/package/metadata.json" "$_path"
  install -Dm 644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
