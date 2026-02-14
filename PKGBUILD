# Maintainer: lxtshawn <lian1995226@gmail.com>
pkgname=papdieo-bin
pkgver=0.1.3
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
sha256sums_x86_64=('ce8242389a08a9e4fd5babb67d969db9fb5677755ea8fe16da2e8bf2a9d27371')
sha256sums_aarch64=('211e9787dfe871a6690af128e20823edcc0f34f92490dcd96a032f76b89c5fc6')

package() {
  local dist_dir="papdieo-v$pkgver-linux-$CARCH"

  install -Dm755 "$srcdir/$dist_dir/papdieo" "$pkgdir/usr/bin/papdieo"
  install -Dm644 "$srcdir/$dist_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$dist_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
