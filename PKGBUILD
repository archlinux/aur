# Maintainer: zrrzw <hellohizrr123@outlook.com>
# Contributor: Kiri <kiri@vern.cc>
# Contributor: Zenvie <134689569+Zenvie@users.noreply.github.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=meta-rules-dat-lite
pkgver=20260312
pkgver() {
  date +'%Y%m%d'
}
pkgrel=1
pkgdesc="lite version of rules dat files by MetaCubeX"
arch=(any)
url="https://github.com/MetaCubeX/meta-rules-dat"
license=(CC-BY-SA-4.0 GPL-2.0-or-later GPL-3.0-or-later)

source=("$url/raw/release/geoip-lite.dat"
        "$url/raw/release/geosite-lite.dat"
        "$url/raw/release/geoip-lite.dat.sha256sum"
        "$url/raw/release/geosite-lite.dat.sha256sum")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  sha256sum -c *.dat.sha256sum
}

package() {  
  install -Dm644 -t "$pkgdir/etc/clash" *.dat
}
