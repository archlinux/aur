# Maintainer: Marlon Kranz <dev@marlonkranz.com>
pkgname=cast-helper-bin
_pkgname=cast-helper
pkgver=0.2.1
pkgrel=1
pkgdesc="Chromecast and AirPlay mirroring and media playback, shared by the Dux Shell Cast plugin and other apps (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Conava/cast-helper"
license=('MIT')
depends=('glibc' 'avahi' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugin-pipewire' 'gst-plugin-va')
optdepends=('gst-plugins-good: more formats and photos'
            'gst-libav: converting videos'
            'libheif: HEIC photos'
            'doubletake-bin: AirPlay mirroring')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Conava/cast-helper/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-x86_64")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-aarch64")
sha256sums=('fb33b89e664985fce73ca1a81265b63c3d741593ef8a4dd94f70d00490a5fdd1')
sha256sums_x86_64=('5f5468b8523503635160e51a00905fe62fb64f27904306ede0bc0f21bc177a2f')
sha256sums_aarch64=('2a69b037704f93388da4b842a171b2973a3793f417504755c430c6e02b894e9c')

package() {
  install -Dm755 "$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
