# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=shadowsocks-go-geolite2-country
pkgname=$_pkgname-git
pkgver=20220912012541
pkgrel=1
pkgdesc="MaxMind GeoLite2 country database for shadowsocks-go"
arch=('any')
url="https://github.com/Dreamacro/maxmind-geoip"
license=('custom')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "$pkgname::git+$url.git#branch=release"
    'LICENSE'
)
b2sums=(
    'SKIP'
    '1707ac1ef0f204942b3be9130c679b04e5690d2d2feb086acdf89d30c85dfe833da8c576d4b4f6144d0dd712248dbff034ea2429a819e57c051679aa6ac85755'
)

pkgver() {
    cd $pkgname
    git show -s --format=%cd --date=format:%Y%m%d%H%M%S
}

package() {
    install -Dm644 -t "$pkgdir"/usr/share/licenses/"$pkgname"/ LICENSE
    cd $pkgname
    install -d "$pkgdir"/usr/share/shadowsocks-go
    install -Dm644 -t "$pkgdir"/usr/share/shadowsocks-go/ Country.mmdb
}
