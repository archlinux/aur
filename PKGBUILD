# Maintainer: crian <crian84 at gmail dot com>

pkgname=fontpreview-git
pkgver=1.0.6.r4.ge18f6d3
pkgrel=1
pkgdesc="Very customizable and minimal font previewer written in bash"
arch=('any')
url="https://github.com/sdushantha/fontpreview"
license=('MIT')
depends=('xdotool' 'fzf' 'imagemagick' 'sxiv')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -m755 -D fontpreview "$pkgdir/usr/bin/fontpreview"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README"
}
