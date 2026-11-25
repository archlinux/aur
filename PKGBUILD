# Maintainer: Marlon Kranz <dev@marlonkranz.com>
pkgname=cast-helper-bin
_pkgname=cast-helper
pkgver=0.2.0
pkgrel=1
pkgdesc="Chromecast and AirPlay mirroring and media playback, shared by the Dux Shell Cast plugin and other apps (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Conava/dux-cast"
license=('MIT')
depends=('glibc' 'avahi' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugin-pipewire' 'gst-plugin-va')
optdepends=('gst-plugins-good: more formats and photos'
            'gst-libav: converting videos'
            'libheif: HEIC photos'
            'doubletake-bin: AirPlay mirroring')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Conava/dux-cast/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-x86_64")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-aarch64")
sha256sums=('fb33b89e664985fce73ca1a81265b63c3d741593ef8a4dd94f70d00490a5fdd1')
sha256sums_x86_64=('4dd3ffbd281ab2cbf3952e7a7590a38a66b5e2f99b282c5d6da6dbcf248004c0')
sha256sums_aarch64=('8c4e6858c6951dd699cc718001e452a08e5afda0a55182994f3b67c4857b5889')

package() {
  install -Dm755 "$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
