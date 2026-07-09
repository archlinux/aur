# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
# Maintainer: hour-keeper <lok-ation@outlook.com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Zenvie <134689569+Zenvie@users.noreply.github.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-rules-dat
pkgver=202607082259
pkgrel=1
pkgdesc="Enhanced edition of V2Ray rules dat files."
arch=('any')
_author=Loyalsoldier
url="https://github.com/${_author}/${pkgname}"
license=('GPL3')
provides=('v2ray-domain-list-community' 'v2ray-geoip' 'xray-geoip' 'xray-geosite')
conflicts=('v2ray-domain-list-community' 'v2ray-geoip' 'xray-geoip' 'xray-geosite')
source=("geoip-$pkgver.dat::${url}/releases/download/${pkgver}/geoip.dat"
        "geosite-$pkgver.dat::${url}/releases/download/${pkgver}/geosite.dat")
sha256sums=('93b145f90017318c2d228ee7eaf539229d7c46ed598499f22eba16861eac59ad'
            '75fe7ce7cdd4852e0123c71dff2c5251d4a54083e2f4db8a876466f8373609d4')

package() {
    local d
    for d in v2ray xray; do
        install -Dm644 "$srcdir/geoip-$pkgver.dat"   "$pkgdir/usr/share/$d/geoip.dat"
        install -Dm644 "$srcdir/geosite-$pkgver.dat" "$pkgdir/usr/share/$d/geosite.dat"
    done
}
