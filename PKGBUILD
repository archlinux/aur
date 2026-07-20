# Maintainer: Elias Elwyn <a@jthvai.net>

pkgname=lightningcss-cli-bin
_pkgname=${pkgname%-bin}
pkgver=1.33.0
pkgrel=1
pkgdesc='Extremely fast CSS parser, transformer, and minifier'
license=(MPL-2.0)

url="https://lightningcss.dev/"
source_x86_64=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_pkgname-linux-x64-gnu/-/$_pkgname-linux-x64-gnu-$pkgver.tgz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_pkgname-linux-arm64-gnu/-/$_pkgname-linux-arm64-gnu-$pkgver.tgz")
sha256sums_x86_64=('17b565d76c88103460916be8b45cdfc87dbec611daaa180ad9f75c8a356c4b31')
sha256sums_aarch64=('17b565d76c88103460916be8b45cdfc87dbec611daaa180ad9f75c8a356c4b31')

arch=(x86_64 aarch64)
depends=(glibc libgcc libgcc_s.so)
conflicts=(lightningcss lightningcss-cli)
provides=(lightningcss lightningcss-cli)
options=('!strip' '!debug')

package() {
  cd "$srcdir/package"
  install -Dm755 lightningcss -t "$pkgdir/usr/bin"
}
