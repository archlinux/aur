# Maintainer: lxtshawn <lian1995226@gmail.com>
pkgname=papdieo-bin
pkgver=0.2.1
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
sha256sums_x86_64=('34a8f3532feaca167808d6abf6f11d7c9e81577e7dd7da6475fdcd057bb84aeb')
sha256sums_aarch64=('fe3a6db2cebd8e0945226f16c48a4092dad9dec29ea7540c35e29a1e4b16f765')

package() {
  local dist_dir="papdieo-v$pkgver-linux-$CARCH"

  install -Dm755 "$srcdir/$dist_dir/papdieo" "$pkgdir/usr/bin/papdieo"
  install -Dm644 "$srcdir/$dist_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$dist_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
