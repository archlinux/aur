#!/bin/sh

# Maintainer: Zhuo FENG <fenprace.i@gmail.com>

pkgname=mosdns-cn
pkgver=1.1.4
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

sha256sums=('a213de8c624438a066042ad9ed0eb0d419ce919f8a3d0d8dcc4eceb3f9181c9a')
