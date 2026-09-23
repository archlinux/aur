# Maintainer: BarbUk <julien.virey@gmail.com>

pkgname=rackpeek-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='CLI tool to discover, manage, and document your IT infrastructure and home lab.'
arch=(x86_64 aarch64)
url='https://github.com/Timmoth/RackPeek'
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(glibc libgcc libstdc++)
options=(!strip)
source=($pkgname.install)
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/${url##*/}-${pkgver}/${pkgname%-bin}_${pkgver//./_}_linux-x64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/${url##*/}-${pkgver}/${pkgname%-bin}_${pkgver//./_}_linux-arm64")
sha256sums=('14cd89ed266911aff4d52d76bb976a4cb3ad602cbbc939785a72fd3e45cd4c01')
sha256sums_x86_64=('c7bb62baca4bfef3482a2188ce55508e71d0cfcb3123d145111255aaab09d3cc')
sha256sums_aarch64=('5760dd9a1c7f2a47bee662c7983f505c48a8960f2ff418c516545c57e4a4cfa6')
install=$pkgname.install

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
