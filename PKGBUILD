# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel Martí <mvdan@mvdan.cc>

pkgname=shfmt-bin
_pkgname=shfmt
pkgver=3.4.2
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
sha256sums_x86_64=('9cc743f058ab8896ca6fa94a7f2e570b95294e8a142600f09fe832e406a88f18')
sha256sums_i686=('ca587569a39bb9077c3fcc90f15a95f8b5083616436f47fece03eb7bf435e964')
sha256sums_armv7h=('86a093331ef12b232697b7efa38001d544d5bc7674e5964bda012765fe4d347a')
sha256sums_aarch64=('93852ee7d64389802a65c9e58840eebcae43c771d7dcd73d2e25b8b0b87e7966')

package() {
  install -Dm755 "$pkgname-$pkgver.$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$pkgname-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
