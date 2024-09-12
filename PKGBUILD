# Maintainer: Yuki Sireneva <yuki dot utk8g at gmail dot com>
pkgname=sticker.webp-git
pkgver=r7.g434f197
pkgrel=1
pkgdesc='Express yourself with simple terminal utility'
arch=('any')
url="https://github.com/q60/${pkgname%-git}"
license=('Unlicense')
depends=('bash')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "r$(git rev-list --count HEAD).g$(git log -1 --format=%h --abbrev=7)"
}

package() {
    cd "$pkgname"
    install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
