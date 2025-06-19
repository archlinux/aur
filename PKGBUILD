# Maintainer: Cauã Alvarenga Neves <cauaalvarenganeves@gmail.com>
# Upstream Developer: Mungai Njoroge <cwilvx (GitHub)>

_pkgname=swingmusic
pkgname="$_pkgname-bin"
pkgver=2.0.8
pkgrel=1
pkgdesc="Swing Music is a beautiful, self-hosted music player for your local audio files. Like a cooler Spotify ... but bring your own music."
arch=('x86_64')
url="https://swingmx.com/"
license=('MIT')
depends=()
provides=('swingmusic')
optdepends=('ffmpeg: audio silence skip feature')
conflicts=('swingmusic-beta-bin' 'swingmusic')

source=("https://github.com/swingmx/swingmusic/releases/download/v2.0.8/swingmusic_linux_amd64"
        "https://raw.githubusercontent.com/swingmx/swingmusic/refs/tags/v$pkgver/LICENSE")

sha256sums=('9bb03f9a4d691d476791969267f7f816a4548e0c367c7c838f492f8ffd8f10e3' '30b0f446384bbda0c6d6b8ca0655e3fe76194828ec4065a9ffffe876c8944fda')

package() {
    install -Dm755 "$srcdir/swingmusic_linux_amd64" "$pkgdir/usr/bin/swingmusic"
    install -Dm644 "$srcdir/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
