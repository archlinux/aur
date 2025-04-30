# Maintainer: Meow0x7E <Meow0x7E@outlook.com>
pkgname=ttf-digital-numbers-git
pkgver=r47.6c52a4a
pkgrel=1
pkgdesc="A fixed width (web)font in a cool liquid-crystal display (LCD) style."
arch=('any')
url="https://github.com/s-a/digital-numbers-font"
license=('OFL-1.1')
source=("${pkgname%-git}::git+https://github.com/s-a/digital-numbers-font.git#branch=gh-pages")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm 644 "dist/DigitalNumbers-Regular.ttf" "$pkgdir/usr/share/fonts/TTF/DigitalNumbers-Regular.ttf"
    install -Dm 644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
