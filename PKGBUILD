# Maintainer: Sneexy <sneexy at synth dot download>

_gitname="kvitals"
pkgname=plasma6-applets-kvitals-git
pkgver=2.5.0.r0.2721678
pkgrel=1
pkgdesc="A lightweight KDE Plasma 6 panel widget that displays live system vitals directly in your top bar."
arch=(any)
url="https://github.com/yassine20011/$_gitname"
license=(GPL-3.0)
depends=('libplasma')
source=("$_gitname"::"git+${url}")
sha256sums=('SKIP')
# this doesn't actually exist yet, but in case I/someone else does package it, probably good to have early on
provides=('plasma6-applets-kvitals')
conflicts=('plasma6-applets-kvitals')

package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.kvitals"
  mkdir -p "$_path"
  cp -r "$srcdir/$_gitname/contents" "$_path"
  cp -r "$srcdir/$_gitname/metadata.json" "$_path"
  install -Dm 644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
