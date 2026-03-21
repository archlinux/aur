# Maintainer: lxtshawn <lian1995226@gmail.com>
pkgname=papdieo-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Hyprland-compatible wallpaper management CLI (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/xiaotinglian/papdieo"
license=('MIT')
depends=(
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'wayland'
  'hyprland'
)
provides=('papdieo')
conflicts=('papdieo' 'papdieo-git')

source_x86_64=("$url/releases/download/v$pkgver/papdieo-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/papdieo-v$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('c029b7878dab9cf41bf6a9873674923e9596923a3a682c507194ee4cfc1100f8')
sha256sums_aarch64=('a07cf13236ee2d2f9f92eee97d3a0a10f2cf5ccef11ad4f99c512244f7d127b3')

package() {
  local dist_dir="papdieo-v$pkgver-linux-$CARCH"

  install -Dm755 "$srcdir/$dist_dir/papdieo" "$pkgdir/usr/bin/papdieo"
  install -Dm644 "$srcdir/$dist_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$dist_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
