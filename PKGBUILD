# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-sdk-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="OA SDK — runnable Rust tutorials, examples, benchmarks, and applications (pre-built binaries)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=('alsa-lib' 'vulkan-icd-loader')
provides=("oa-sdk=${pkgver}")
conflicts=('oa-sdk')
options=('!strip' '!debug')
_archive="oa-sdk-${pkgver}-1-x86_64.pkg.tar.zst"
source=("https://github.com/realminc/oa/releases/download/v${pkgver}/${_archive}")
noextract=("${_archive}")
sha256sums=('c137906c4a553073a69d8cf996761396fb83c426cd22cccde515637fd75a8d3b')

package() {
  bsdtar -xf "$srcdir/${_archive}" -C "$pkgdir" usr
}
