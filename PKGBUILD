# Maintainer : cmach_socket <cmach_socket@outlook.com>
_reponame="org.kde.plasma.minimax-token-monitor"
pkgdesc="A plasma applets to monitor minimax token usage."
pkgname=minimax-token-monitor
pkgver=26.9.2
pkgrel=1
arch=(any)
url="https://github.com/cmachsocket/$pkgname"
depends=(plasma-desktop kdeplasma-addons)
license=(GPL-3.0-or-later)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e7184e73f8d84cc3915078fad8e203b8d8efe6516adb2ee003749b63285ce0a')
package() {
  _path="$pkgdir/usr/share/plasma/plasmoids/$_reponame"
  mkdir -p "$_path"
  mkdir -p "$_path/contents"
  cp -r "$srcdir/$pkgname-$pkgver/contents"/* "$_path/contents"
  cp -r "$srcdir/$pkgname-$pkgver/metadata.json" "$_path/metadata.json"
  install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
