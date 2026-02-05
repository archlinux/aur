# Maintainer: Zachary M <minein12@protonmail.com>

pkgname=falcond-profiles
pkgver=r23.a3e0e63
_pkgver=a3e0e63303c0a310a504c5f3e2a9d71496d7aaab # commit version
pkgrel=1
pkgdesc='Default falcond profiles'
url='https://github.com/PikaOS-Linux/falcond-profiles'
arch=(any)
license=(MIT)
makedepends=(git)

source=("git+${url}.git#commit=${_pkgver}")
sha256sums=('5f72eaecea1ad6da073f4e9c173cab617ac3ff348d9e548cab3fbd25978354fe')

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
