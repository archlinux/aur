# Maintainer : cmach_socket <cmach_socket@outlook.com>
_reponame="org.kde.plasma.vutronmusic-lyrics"
pkgname=plasma6-applets-vutronmusic-lyrics
pkgver=26.9.20
pkgrel=1
arch=(any)
url="https://github.com/cmachsocket/$_reponame"
depends=(plasma-desktop kdeplasma-addons)
license=(GPL-3.0-or-later)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30dff51059ef93cc0a449f1464b1687eb3a5ae6613d8476b1b3b1a8dc074d7ad')
package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/$_reponame"
  mkdir -p "$_path"
  mkdir -p "$_path/contents"
  cp -r "$srcdir/$_reponame-$pkgver/contents"/* "$_path/contents"
  cp -r "$srcdir/$_reponame-$pkgver/metadata.json" "$_path/metadata.json"
  install -Dm 644 "$srcdir/$_reponame-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
