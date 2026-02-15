# Maintainer: lxtshawn <lian1995226@gmail.com>
pkgname=papdieo-bin
pkgver=0.1.6
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
sha256sums_x86_64=('c96cc334111ba2bd585b60ef957f652c7520f383c7fe64eb226cb69ed1253f3f')
sha256sums_aarch64=('15e9f11789c267f094819fa24ddc0c43e7e7cf60585d96f222865fd6b3c42a36')

package() {
  local dist_dir="papdieo-v$pkgver-linux-$CARCH"

  install -Dm755 "$srcdir/$dist_dir/papdieo" "$pkgdir/usr/bin/papdieo"
  install -Dm644 "$srcdir/$dist_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$dist_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
