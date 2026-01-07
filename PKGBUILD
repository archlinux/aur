# Maintainer: Zachary M <minein12@protonmail.com>

pkgname=falcond-profiles
pkgver=r20.0f87c74
_pkgver=0f87c748cf34a9bcbc4351ad051bcef8cce79158
pkgrel=1
pkgdesc='Default falcond profiles'
url='https://github.com/PikaOS-Linux/falcond-profiles'
arch=(any)
license=('MIT')

source=(git+${url}.git#commit=${_pkgver})
sha256sums=('a658aef941b00630e6c4d39b8130fea9e7a43b0236260c753db44d73a2772fc5')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    _pkgdir="$pkgdir/usr/share/falcond"
    cd "$pkgname"

    install -Dm 644 LICENSE \
        -t "$pkgdir/usr/share/licenses/${pkgname}"

    install -vdm 755 "$_pkgdir" "$_pkgdir/profiles" "$_pkgdir/profiles/handheld" "$_pkgdir/profiles/htpc"

    cp -r usr/share/falcond/* "$pkgdir/usr/share/falcond/"
}
