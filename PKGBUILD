# Contributor: Cauã Alvarenga Neves <cauaalvarenganeves@gmail.com>
# Contributor: tee < teeaur at duck dot com >

_pkgname=swingmusic
pkgname="$_pkgname-bin"
pkgver=3.0.0
pkgrel=1
pkgdesc="Swing Music is a beautiful, self-hosted music player for your local audio files. Like a cooler Spotify ... but bring your own music."
arch=('x86_64')
url="https://swingmx.com"
license=(AGPL-3.0-or-later)
depends=(glibc zlib)
provides=('swingmusic')
conflicts=('swingmusic' 'swingmusic-beta-bin')
optdepends=('ffmpeg: audio silence skip feature')
source=("https://github.com/swingmx/swingmusic/raw/v$pkgver/LICENSE")
#source_x86_64=("https://github.com/swingmx/swingmusic/releases/download/v$pkgver/swingmusic-v$pkgver-linux-$arch.tar.gz")
source_x86_64=("$_pkgname-$pkgver::https://github.com/swingmx/swingmusic/releases/download/v$pkgver/swingmusic_linux_$arch")
b2sums=('6fa2a6adf165a614637f4aae5b323c427b99c2d13f9ab55eefae012dc3dbeebe5957cd2e2497e4c38426088a41dac89f6ac6284af6cf6a4a67a6780f409e8237')
b2sums_x86_64=('b9a295cee9ffd2ed75838a903ab4b55f1a6119183b71d14d42d7a560ce8e0ad9101ea970f9a310ca6b47a6593f9c38e0a6edd56dd8ddb12399192a1664fa95a9')

package() {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
