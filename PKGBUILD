# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel Martí <mvdan@mvdan.cc>

pkgname=shfmt-bin
_pkgname=shfmt
pkgver=3.4.3
pkgrel=1
pkgdesc="Format shell programs"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mvdan/sh"
license=('BSD')
depends=('glibc')
provides=('shfmt')
conflicts=('shfmt')

source=("$pkgname-$pkgver.LICENSE::https://raw.githubusercontent.com/mvdan/sh/v$pkgver/LICENSE")
_source_base="$pkgname-$pkgver.$_pkgname::$url/releases/download/v$pkgver"
source_x86_64=("$_source_base/${_pkgname}_v${pkgver}_linux_amd64")
source_i686=("$_source_base/${_pkgname}_v${pkgver}_linux_386")
source_armv7h=("$_source_base/${_pkgname}_v${pkgver}_linux_arm")
source_aarch64=("$_source_base/${_pkgname}_v${pkgver}_linux_arm64")

noextract=("$pkgname-$pkgver.LICENSE" "$pkgname-$pkgver.$_pkgname")

sha256sums=('ce63850f77649f00d1394045e2794ffb09a5596beabac51c9548edd958845d7c')
sha256sums_x86_64=('713ef49db9a60a00636814a507da851b58da6b4b98a3627188fba0a61b60f9a8')
sha256sums_i686=('107712fbbec6c90b1781b762042218bbcb43f553e7085f1de800d6a7f16d29b8')
sha256sums_armv7h=('31efacbcb61b00d4375b193da5af4a7213cf585bb4e19b649531240a2ab9e7ff')
sha256sums_aarch64=('b4f5d7b53012a1a7fdac5df8f13d829d82bc7ace53da4a09c532ac562589b106')

package() {
  install -Dm755 "$pkgname-$pkgver.$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$pkgname-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
