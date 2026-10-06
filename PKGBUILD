# Maintainer: emsger <earthmessenger@qq.com>

pkgname=bitsrunlogin-go
pkgver=1.6.8
pkgrel=1
pkgdesc="Headless login tool for Srun (深澜) campus networks, written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Mmx233/BitSrunLoginGo"
license=('AGPL-3.0-only')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bfabe44928c51e1a020aaf153dac2cb03e34efeeb659e0bf5b99d3ec99339584')

build() {
  cd "BitSrunLoginGo-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -buildvcs=false -o bitsrun ./cmd/bitsrun
}

package() {
  cd "BitSrunLoginGo-$pkgver"
  install -Dm755 bitsrun "$pkgdir/usr/bin/bitsrun"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
