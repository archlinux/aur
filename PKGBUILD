# Maintainer : cmach_socket <cmach_socket@outlook.com>
_reponame="org.kde.plasma.vutronmusic-lyrics"
pkgname=plasma6-applets-vutronmusic-lyrics
pkgver=26.10.8
pkgrel=1
arch=(any)
url="https://github.com/cmachsocket/$_reponame"
depends=(plasma-desktop kdeplasma-addons)
license=(GPL-3.0-or-later)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1bf0fd9c76c8b33cbb24255dc561bb60cd6b6181f28b53d145a0b1755b604f51')
package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/$_reponame"
  mkdir -p "$_path"
  mkdir -p "$_path/contents"
  cp -r "$srcdir/$_reponame-$pkgver/contents"/* "$_path/contents"
  cp -r "$srcdir/$_reponame-$pkgver/metadata.json" "$_path/metadata.json"
  install -Dm 644 "$srcdir/$_reponame-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
