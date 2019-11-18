# Maintainer: JunYoung Gwak <aur@jgwak.com>

_pkgname=namespaced-openvpn
pkgname=${_pkgname}-git
pkgver=r32.5ef019d
pkgrel=1
pkgdesc='Wrapper for OpenVPN on Linux solving various privacy issues'
arch=('any')
license=('MIT')
url="https://github.com/slingamn/namespaced-openvpn"
makedepends=(git)
depends=(python openvpn)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -D -m 755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/"
}
