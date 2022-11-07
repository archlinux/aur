# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=jd-tool-bin
_pkgname=jd
pkgver=1.6.1
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
sha256sums_x86_64=('040f23db971a40e796d53011ab87db12744d0b861a1f0d4058fde4487cfbc715')
sha256sums_aarch64=('a537a0f83bbffaea18230ac061e3372f7dee5a690f95a713ee2cd9ba64ccdf50')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/jd"
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/jd/LICENSE"
}
