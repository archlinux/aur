# Maintainer: CosmicPredator <cosmicpredator@proton.me>
pkgname=chibi-cli-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Chibi for AniList - A lightweight anime & manga tracker CLI app powered by AniList."
arch=('x86_64')
url="https://chibi-cli.pages.dev/"
license=('GPL3')
source=(
    "https://github.com/CosmicPredator/chibi-cli/releases/download/${pkgver}/chibi_${pkgver}_amd64.deb"
)
sha256sums=('SKIP')

options=('!debug')

package() {
    bsdtar -xf "$srcdir/chibi_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.*
    
    install -Dm755 usr/local/bin/chibi "$pkgdir/usr/bin/chibi"
}
