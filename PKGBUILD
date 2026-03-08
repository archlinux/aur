# Maintainer: BarbUk <julien.virey@gmail.com>

pkgname=rackpeek-bin
pkgver=1.3.0
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
sha256sums_x86_64=('616bce250f22ac91952c93593c6d7733402469cd8965f942e254c43b825bfced')
sha256sums_aarch64=('5b48570abaeb50a5bd4ca9f347af9bb7fe57cb4772b9b8a01882fbd0bd94b7d0')
install=$pkgname.install

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
