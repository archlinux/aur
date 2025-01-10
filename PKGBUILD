# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=lightningcss-cli-bin
_pkgname=${pkgname%-bin}
pkgver=1.29.1
pkgrel=1
pkgdesc='Extremely fast CSS parser, transformer, and minifier'
license=(MPL-2.0)

url="https://lightningcss.dev/"
source_x86_64=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_pkgname-linux-x64-gnu/-/$_pkgname-linux-x64-gnu-$pkgver.tgz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_pkgname-linux-arm64-gnu/-/$_pkgname-linux-arm64-gnu-$pkgver.tgz")
sha256sums_x86_64=('66d100fa92c50cafdebb844c577c90624514abea52fa2cfe13c149edbb230da4')
sha256sums_aarch64=('66d100fa92c50cafdebb844c577c90624514abea52fa2cfe13c149edbb230da4')

arch=(x86_64 aarch64)
depends=(glibc gcc-libs)
conflicts=(lightningcss lightningcss-cli)
provides=(lightningcss lightningcss-cli)
options=('!strip' '!debug')

package() {
  cd "$srcdir/package"
  install -Dm755 lightningcss -t "$pkgdir/usr/bin"
}
