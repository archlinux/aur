# Maintainer: Zachary M <minein12 at protonmail dot com>

pkgname=falcond-profiles
pkgver=r25.2c521cb
_pkgver=2c521cbe01a3fb092ef3ddf61b111a600ef9f673 # commit version
pkgrel=1
pkgdesc='Default falcond profiles'
url='https://github.com/PikaOS-Linux/falcond-profiles'
arch=(any)
license=(MIT)
makedepends=(git)

source=("git+${url}.git#commit=${_pkgver}")
sha256sums=('8c213da5101b897649d64098d68cbbf5797ab0627e804155afdc07b740f60136')

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
