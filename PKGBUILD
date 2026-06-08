# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-media-tools
pkgver=1.0
pkgrel=1
pkgdesc="Professional Screen Recorder with Timer, Tray, and Hotkeys"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'ffmpeg' 'pipewire-pulse' 'scrot' 'libappindicator-gtk3' 'libx11')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-media-tools 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-media-tools
  gcc shrike-media-tools.c -o shrike-media-tools $(pkg-config --cflags --libs gtk+-3.0 x11 appindicator3-0.1)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-media-tools 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-media-tools
  install -Dm755 shrike-media-tools "$pkgdir/usr/bin/shrike-media-tools"
  install -Dm644 shrike-media-tools.desktop "$pkgdir/usr/share/applications/shrike-media-tools.desktop"
}
