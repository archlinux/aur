# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: gsh <gsh.gsh.gsh@protonmail.com>
# Contributor: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-domain-list-custom
pkgver=202603282222
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V (Loyalsoldier's rules)"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-domain-list-community')
conflicts=('v2ray-domain-list-community')

source=("geosite-${pkgver}.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/${pkgver}/geosite.dat")
sha256sums=('c202e5ed36a591ddd6d7b0164453d36c7c91a32be45e4d26256fd19d24c70b71')

latestver() {
    curl -fsSI 'https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat' | tr -d '\r' |
    sed -nE 's#^location: .*/download/([^/]+)/.*$#\1#p'
}

package() {
  install -Dm644 "geosite-${pkgver}.dat" "$pkgdir/usr/share/v2ray/geosite.dat"
}
