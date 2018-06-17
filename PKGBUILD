# Maintainer: Davide Depau <davide@depau.eu>

pkgname=libviperfx-nonfree-bin
pkgver=r11.6f7d0da
pkgrel=1
pkgdesc="ViPER FX core binary library (non free)"
url="https://github.com/vipersaudio/viperfx_core_binary"
arch=("x86_64")
license=("custom")
provides=("libviperfx")
conflicts=("libviperfx")
source=("git+https://github.com/vipersaudio/viperfx_core_binary.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/viperfx_core_binary"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	install -Dm755 "$srcdir/viperfx_core_binary/libviperfx_x64_linux.so" "$pkgdir/usr/lib/libviperfx.so"
}
