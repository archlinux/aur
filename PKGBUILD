# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel Martí <mvdan@mvdan.cc>

pkgname=shfmt-bin
_pkgname=shfmt
pkgver=3.5.0
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
sha256sums_x86_64=('8feea043364a725dfb69665432aee9e85b84c7f801a70668650e8b15452f6574')
sha256sums_i686=('1e42df61a29cda969a287f598d6f1a789a23fe8ddb0485e785b6cdf57234f60e')
sha256sums_armv7h=('e6d059da725f5dfacb663505efa4f9527a3178127f46b2dfb2479f7b8b721820')
sha256sums_aarch64=('2dec40f18622873dd3bf84fda17f43a0ae93b5305ead909dc0e91f6479d359c6')

package() {
  install -Dm755 "$pkgname-$pkgver.$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$pkgname-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
