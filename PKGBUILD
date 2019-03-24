# Maintainer: Ryan Kes <alrayyes@gmail.com>

pkgname=corrupter-git
pkgver=r21.b8b55be
pkgrel=1
pkgdesc='Simple image glitcher suitable for producing nice looking i3lock backgrounds'
arch=('i686' 'x86_64')
url='https://github.com/r00tman/corrupter'
makedepends=('git' 'go')
license=('custom:ISC')

md5sums=('SKIP')

source=("git+https://github.com/r00tman/${pkgname%-git}")

pkgver() {
    cd "$srcdir"/"${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/"${pkgname%-git}"
    go build
}

package() {
    cd "$srcdir"/"${pkgname%-git}"

    install -Dm755 corrupter "${pkgdir}/usr/bin/corrupter"
#    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
