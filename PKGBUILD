# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
# Maintainer: hour-keeper <lok-ation@outlook.com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Zenvie <134689569+Zenvie@users.noreply.github.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-rules-dat
pkgver=202607212250
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
sha256sums=('af332ab88eb4bb15e3cd10f03f5542e90655ee4bd5bf0e23949cfbd1e46bc20f'
            'd9c5ab9478e6d9a1baa8d68e8a31a6d292114ce18738aeb035704225753176ac')

package() {
    local d
    for d in v2ray xray; do
        install -Dm644 "$srcdir/geoip-$pkgver.dat"   "$pkgdir/usr/share/$d/geoip.dat"
        install -Dm644 "$srcdir/geosite-$pkgver.dat" "$pkgdir/usr/share/$d/geosite.dat"
    done
}
