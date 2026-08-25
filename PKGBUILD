# Maintainer: lxtshawn <lian1995226@gmail.com>
pkgname=papdieo-bin
pkgver=0.2.3
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
sha256sums_x86_64=('07949c6b194d6d28187adb668975367bb99feb86fb9aac1aad84ece354a3b540')
sha256sums_aarch64=('09cefc6e5453496597145c96dd9b434d711bd31024ce0703d21c7cbebac76193')

package() {
  local dist_dir="papdieo-v$pkgver-linux-$CARCH"

  install -Dm755 "$srcdir/$dist_dir/papdieo" "$pkgdir/usr/bin/papdieo"
  install -Dm644 "$srcdir/$dist_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$dist_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
