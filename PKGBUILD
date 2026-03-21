# Maintainer: cap153 <1536989047@qq.com>

pkgname=rrwm-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A window manager developed in Rust for River 0.4.0, using the cosmic/bspwm layout."
arch=("x86_64")
url="https://github.com/cap153/rrwm"
license=('MIT')
source=("rrwm.desktop")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/cap153/rrwm/releases/download/v$pkgver/rrwm-linux-amd64.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
options=('!strip')

prepare() {
  cd "$srcdir" || exit 1
  if [ "$CARCH" == "x86_64" ]; then
    tar -zxvf "$pkgname-$pkgver-x86_64.tar.gz"
  fi
}

package() {
  cd "$srcdir" || exit 1
	install -Dm644 rrwm.desktop -t "$pkgdir/usr/share/wayland-sessions/"
  install -Dm755 rrwm "$pkgdir/usr/bin/rrwm"
}
# makepkg --printsrcinfo > .SRCINFO
