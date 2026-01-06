# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: gsh <gsh.gsh.gsh@protonmail.com>
# Contributor: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-domain-list-custom
pkgver=202601052215
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V (Loyalsoldier's rules)"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-domain-list-community')
conflicts=('v2ray-domain-list-community')

source=("geosite-${pkgver}.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/${pkgver}/geosite.dat")
sha256sums=('c97d5b7e68cf37714e6d3909f9ac0e15bbbf94bec185ebe38c9016ea44c8eed7')

latestver() {
    curl -fsSL "https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/releases/latest" |
    jq -r '.tag_name // empty'
}

package() {
  install -Dm644 "geosite-${pkgver}.dat" "$pkgdir/usr/share/v2ray/geosite.dat"
}
