# Maintainer: Zachary M <minein12@protonmail.com>

pkgname=falcond-profiles
pkgver=1.0
pkgrel=1
pkgdesc='Default falcond profiles'
url='https://github.com/PikaOS-Linux/falcond-profiles'
arch=(any)
license=('MIT')

source=($pkgname-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz)
sha256sums=('73301ba736340183c2ac7cef7539ad73811918afe5f7a6884f7306f26d28a44e')

package() {
    _pkgdir="$pkgdir/usr/share/falcond"
    cd "$pkgname-main"

    install -Dm 644 LICENSE \
        -t "$pkgdir/usr/share/licenses/${pkgname}"

    install -vdm 755 "$_pkgdir" "$_pkgdir/profiles" "$_pkgdir/profiles/handheld" "$_pkgdir/profiles/htpc"

    cp -r usr/share/falcond/* "$pkgdir/usr/share/falcond/"
}
