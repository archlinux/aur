# Maintainer: BarbUk <julien.virey@gmail.com>

pkgname=rackpeek-bin
pkgver=2.0.0
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
sha256sums_x86_64=('62466e7a73518c55469a9c8064836a2aacbacb4be8f749a50c4a6f21a929ec7e')
sha256sums_aarch64=('f62f3d7eb1a5903de90e8c178cebd096312aec3a14a8d9fae0ae050c34c11899')
install=$pkgname.install

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
