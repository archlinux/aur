# Maintainer : cmach_socket <cmach_socket@outlook.com>
_reponame="org.kde.plasma.minimax-token-monitor"
pkgname=minimax-token-monitor
pkgver=26.9.1
pkgrel=1
arch=(any)
url="https://github.com/cmachsocket/$pkgname"
depends=(plasma-desktop kdeplasma-addons)
license=(GPL-3.0-or-later)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dc099e8e427789f893faa50b064936696926acec3a854d2e323a7deb63883b75')
package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/$_reponame"
  mkdir -p "$_path"
  mkdir -p "$_path/contents"
  cp -r "$srcdir/$pkgname-$pkgver/contents"/* "$_path/contents"
  cp -r "$srcdir/$pkgname-$pkgver/metadata.json" "$_path/metadata.json"
  install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
