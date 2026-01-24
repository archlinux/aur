# Maintainer: Zachary M <minein12@protonmail.com>

pkgname=falcond-profiles
pkgver=r21.f52c344
_pkgver=f52c3445a9b9aa18401b7c8e9bf532c37758e585 # commit version
pkgrel=1
pkgdesc='Default falcond profiles'
url='https://github.com/PikaOS-Linux/falcond-profiles'
arch=(any)
license=(MIT)
makedepends=(git)

source=("git+${url}.git#commit=${_pkgver}")
sha256sums=(c0e8d277df3b8e2306a2564d73a952196bf2bbc6ef9162379b671d2e9b0c8524)

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
