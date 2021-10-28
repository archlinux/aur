#!/bin/sh

# Maintainer: Zhuo FENG <fenprace.i@gmail.com>

pkgname=mosdns-cn
pkgver=1.1.1
pkgrel=1
pkgdesc="A DNS forwarder"
license=("GPL3")
arch=("any")
url="https://github.com/IrineSistiana/mosdns-cn"
makedepends=("go")
optdepends=('v2ray-domain-list-community: geosite.dat'
            'v2ray-geoip: geoip.dat'
            'v2ray-rules-dat-git: geosite.dat & geoip.dat')
provides=("mosdns-cn")
conflicts=("mosdns-cn")
source=("$pkgname-$pkgver.tar.gz::https://github.com/IrineSistiana/mosdns-cn/archive/refs/tags/v$pkgver.tar.gz")

build() {
  export GOPATH="$srcdir/gopath"
  cd "$pkgname-$pkgver"
  go build .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('d535b53746ab2c14907ea5972afd3ce0970aefc1cdc64d272059e6757860e569')
