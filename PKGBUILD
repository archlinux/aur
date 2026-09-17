# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Bruno Luvizotto <brunoluvizotto@gmail.com>
pkgname=protoc-gen-js-bin
pkgver=4.0.3
pkgrel=1
pkgdesc="Protocol Buffers for JavaScript"
arch=('x86_64' 'aarch64')
url="https://github.com/protocolbuffers/protobuf-javascript"
license=('Apache-2.0 AND BSD-3-Clause')
depends=('protobuf')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/protobuf-javascript-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/protobuf-javascript-$pkgver-linux-aarch_64.tar.gz")
noextract=(protobuf-javascript-$pkgver-linux-*.tar.gz)
sha256sums_x86_64=('30abc1d57c3cc7105950e56e1b37b41033f6ed989b79efc59b90186c0a835c30')
sha256sums_aarch64=('856585ad455e1f1ce82eebb95ca70415d3d8c017559e35b585d7907239bafa04')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf protobuf-javascript-$pkgver-linux-*.tar.gz -C "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "bin/${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
