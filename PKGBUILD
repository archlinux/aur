# Maintainer: Raphael Freudiger <laser_b at gmx dot ch>
pkgname=chromecastize-git
pkgver=59.c739cec
pkgrel=1
pkgdesc="Bash script to convert video files into Google Chromecast supported format."
arch=('any')
url="https://github.com/bc-petrkotek/chromecastize"
license=('GPL')
depends=('ffmpeg' 'mediainfo')
makedepends=('git')
source=('git+https://github.com/bc-petrkotek/chromecastize.git')
md5sums=('SKIP')

pkgver() {
    cd "chromecastize"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/chromecastize"
}

package() {
    cd "$srcdir/chromecastize"

    install -d "$pkgdir/usr/bin/"
    install -t "$pkgdir/usr/bin/" chromecastize.sh
}
