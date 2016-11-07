# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
pkgname=i3lockmore-git
pkgver=r2.c19aded
pkgrel=1
pkgdesc='A wrapper for i3lock that adds additional functionality'
arch=('any')
url='https://github.com/SammysHP/i3lockmore'
license=('MIT')
depends=('i3lock' 'imagemagick' 'xorg-xset')
source=("${pkgname%-git}::git+https://github.com/SammysHP/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 i3lockmore "${pkgdir}/usr/bin/i3lockmore"
}
