# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel Martí <mvdan@mvdan.cc>

pkgname=shfmt-bin
_pkgname=shfmt
pkgver=3.4.1
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
sha256sums_x86_64=('0c321e80a97cee3ffbff0579ad9f79805f622b306b507d674da00e3caedb8714')
sha256sums_i686=('823d33f3ec49a6ee949682f44e53b912a2a5bf0feca60d019e7eb1fd4fda59fc')
sha256sums_armv7h=('dda1fd6cdfa1a7c0b564591d0164c668d45110d2179d760f12411d4354b150c1')
sha256sums_aarch64=('dc8e0524ab9fc11bca3a363fef62dd8ffd3c2b3f04d780e46b349b7917a8f187')

package() {
  install -Dm755 "$pkgname-$pkgver.$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$pkgname-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
