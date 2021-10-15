# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel Martí <mvdan@mvdan.cc>

pkgname=shfmt-bin
_pkgname=shfmt
pkgver=3.4.0
pkgrel=1
pkgdesc="Format shell programs"
arch=('x86_64' 'i386' 'armv7h' 'aarch64')
url="https://github.com/mvdan/sh"
license=('BSD')
depends=('glibc')
provides=('shfmt')
conflicts=('shfmt')

source=("$pkgname-$pkgver.LICENSE::https://raw.githubusercontent.com/mvdan/sh/v$pkgver/LICENSE")
_source_base="$pkgname-$pkgver.$_pkgname::$url/releases/download/v$pkgver"
source_x86_64=("$_source_base/${_pkgname}_v${pkgver}_linux_amd64")
source_i386=("$_source_base/${_pkgname}_v${pkgver}_linux_386")
source_armv7h=("$_source_base/${_pkgname}_v${pkgver}_linux_arm")
source_aarch64=("$_source_base/${_pkgname}_v${pkgver}_linux_arm64")

noextract=("$pkgname-$pkgver.LICENSE" "$pkgname-$pkgver.$_pkgname")

sha256sums=('ce63850f77649f00d1394045e2794ffb09a5596beabac51c9548edd958845d7c')
sha256sums_x86_64=('5cd7a2b57a0592f919ca2e4249bd567ae3426801a28ae94d0b26f8f2c4ce17f9')
sha256sums_i386=('5cd7a2b57a0592f919ca2e4249bd567ae3426801a28ae94d0b26f8f2c4ce17f9')
sha256sums_armv7h=('5cd7a2b57a0592f919ca2e4249bd567ae3426801a28ae94d0b26f8f2c4ce17f9')
sha256sums_aarch64=('5cd7a2b57a0592f919ca2e4249bd567ae3426801a28ae94d0b26f8f2c4ce17f9')

package() {
  install -Dm755 "$pkgname-$pkgver.$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$pkgname-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
