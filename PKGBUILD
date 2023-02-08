# Maintainer: Moritz Sauter <moritz.sauter7+aur at gmail dot com>

pkgname=tiny-remarkable-scripts-git
pkgver=r5.6d8075d
pkgrel=1
pkgdesc="A set of tiny remarkable scripts to pull and push pdfs via ssh"
arch=("any")
url="https://github.com/mosauter/remarkable_scripts"
license=('MIT')
depends=("imagemagick" "util-linux" "python-rm2pdf")
optdepends=("python-rmrl: for v5 rendering")
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname%-git}::git+$url"
)
b2sums=(
    'SKIP'
)

pkgver() {
    cd "$srcdir/${pkgname%-git}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"

    install -Dm755 "pdf2remarkable" "$pkgdir/usr/bin/pdf2remarkable"
    install -Dm755 "remarkable2pdf" "$pkgdir/usr/bin/remarkable2pdf"
}
