# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=jd-tool-bin
_pkgname=jd
pkgver=1.7.1
pkgrel=1
pkgdesc="JSON diff and patch"
arch=(x86_64 aarch64)
url="https://github.com/josephburnett/jd"
license=(MIT)
provides=(jd-tool)
conflicts=(jd-tool)

source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/josephburnett/$_pkgname/v$pkgver/LICENSE")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-arm64-linux")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-amd64-linux")

sha256sums=('7db445fe94ae6fb0c5ab69a6b47ec38a0e4b6d5a38f9d1493c0d8cb7c8ad2516')
sha256sums_x86_64=('4cdc29dee2f510de8fbaf8743b845a10198179dd19cbe935fba8814658a8ef92')
sha256sums_aarch64=('12aee4b3e0ce52d6b370fb17789d28522ea09ccdcd47c7cdda8b4ba3bab47e79')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/jd"
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/jd/LICENSE"
}
