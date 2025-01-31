# Maintainer: Cauã Alvarenga Neves <cauaalvarenganeves@gmail.com>
# Upstream Developer: Mungai Njoroge <cwilvx (GitHub)>

pkgname=swingmusic-beta-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="Swing Music is a beautiful, self-hosted music player for your local audio files. Like a cooler Spotify ... but bring your own music."
arch=('x86_64')
url="https://github.com/swingmx/swingmusic"
license=('MIT')
depends=()
conflicts=('swingmusic-bin' 'swingmusic')

pkgver() {
    curl -s "https://api.github.com/repos/swingmx/swingmusic/releases" |
        grep -Po '"tag_name": "\K.*?(?=")' | head -n1 | sed 's/^v//'
}

source=("https://github.com/swingmx/swingmusic/releases/download/v$(pkgver)/swingmusic")
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/swingmusic" "$pkgdir/usr/bin/swingmusic"
}
