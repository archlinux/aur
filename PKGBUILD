# Maintainer: Karol Babioch <karol@babioch.de

pkgname=aaxtomp3-git
pkgver=r38.48e2eeb
pkgrel=1
pkgdesc='The purpose of this software is to convert AAX files to a more common MP3 format through a basic bash script frontend to FFMPEG.'
arch=('any')
url='https://github.com/KrumpetPirate/AAXtoMP3'
license=('custom')
depends=('ffmpeg' 'lame')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm 755 AAXtoMP3.sh "$pkgdir/usr/bin/AAXtoMP3.sh"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

