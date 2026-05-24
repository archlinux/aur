# Maintainer: Zachary M <minein12 at protonmail dot com>

pkgname=falcond-profiles
pkgver=r24.5023a84
_pkgver=5023a846980685812334586ae265f8f6a1ded38b # commit version
pkgrel=1
pkgdesc='Default falcond profiles'
url='https://github.com/PikaOS-Linux/falcond-profiles'
arch=(any)
license=(MIT)
makedepends=(git)

source=("git+${url}.git#commit=${_pkgver}")
sha256sums=('c6e73327b8f5adfec9253052344d6be2ce38bbf3dfb21482d77ef7b5bc5a371c')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname"

    install -Dm 644 LICENSE \
        -t "$pkgdir/usr/share/licenses/${pkgname}"

    install -Dm 644 usr/share/falcond/*.conf \
        -t "$pkgdir/usr/share/falcond/"

    install -Dm 644 usr/share/falcond/profiles/*.conf \
        -t "$pkgdir/usr/share/falcond/profiles/"

    install -Dm 644 usr/share/falcond/profiles/handheld/*.conf \
        -t "$pkgdir/usr/share/falcond/profiles/handheld/"

    install -Dm 644 usr/share/falcond/profiles/htpc/*.conf \
        -t "$pkgdir/usr/share/falcond/profiles/htpc/"
}
