# Maintainer: Nguyen Hong Hiep (Syaoran Code) <syaorancode@gmail.com>

pkgname=scrcast
pkgver=3.0
pkgrel=1
pkgdesc="A simple screencast and screenshot script using ffmpeg."
arch=('any')
url="https://gitlab.com/justanoobcoder/scrcast.git"
license=('MIT')
depends=('bash' 'ffmpeg' 'xorg-xrandr')
makedepends=('make')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s" "$pkgver"
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
