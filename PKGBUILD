# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=jd-tool-bin
_pkgname=jd
pkgver=1.6.0
pkgrel=1
pkgdesc="JSON diff and patch"
arch=('x86_64' 'aarch64')
url="https://github.com/josephburnett/jd"
license=('MIT')
provides=('jd-tool')
conflicts=('jd-tool')

source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/josephburnett/$_pkgname/v$pkgver/LICENSE")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-arm64-linux")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-amd64-linux")

sha256sums=('7db445fe94ae6fb0c5ab69a6b47ec38a0e4b6d5a38f9d1493c0d8cb7c8ad2516')
sha256sums_x86_64=('c347eb26f833d7ed3e20c45c8104282634fa87d2c34cd972677b649bd82c8c52')
sha256sums_aarch64=('87e022d3e51dda4e5fd54364e70fdbadbbd8ed02bc327b5a6606f2e66769492c')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/jd"
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/jd/LICENSE"
}
