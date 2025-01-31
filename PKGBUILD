# Maintainer: Cauã Alvarenga Neves <cauaalvarenganeves@gmail.com>
# Upstream Developer: Mungai Njoroge <cwilvx (GitHub)>

pkgname=swingmusic-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="Swing Music is a beautiful, self-hosted music player for your local audio files. Like a cooler Spotify ... but bring your own music."
arch=('x86_64')
url="https://github.com/swingmx/swingmusic"
license=('MIT')
depends=()
conflicts=('swingmusic-beta-bin' 'swingmusic')

pkgver() {
    curl -s "https://api.github.com/repos/swingmx/swingmusic/releases/latest" |
        grep -Po '"tag_name": "\K.*?(?=")' | sed 's/^v//'
}

source=("https://github.com/swingmx/swingmusic/releases/download/v$(pkgver)/swingmusic")
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/swingmusic" "$pkgdir/usr/bin/swingmusic"
}
