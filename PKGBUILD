# Maintainer: Maria <maria@kuuro.net>
pkgname=ttf-geist-pixel-font-git
pkgver=r1.bd5f6cc
pkgrel=1
pkgdesc="Pixel typeface designed to complement the Geist font family"
arch=('any')
url="https://github.com/vercel/geist-pixel-font"
license=('OFL-1.1')
makedepends=('git')
source=("$pkgname::git+https://github.com/vercel/geist-pixel-font.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm644 fonts/ttf/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
