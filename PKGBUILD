# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=brightnessztl
pkgver=0.1
pkgrel=1
pkgdesc="A CLI to control device backlight"
arch=('x86_64')
url="http://github.com/hspak/brightnessztl"
license=('MIT')
depends=()
makedepends=('zig-git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/hspak/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ada71f5c0181a979855d50b2b61eb85e780aae88b5421ceefb689d1e04b0049d')

build() {
  cd "${pkgname}-${pkgver}"

  zig build
}

package() {
  cd "${pkgname}-${pkgver}"

  # binary
  install -D -m 0755 "zig-cache/bin/brightnessztl" "${pkgdir}/usr/bin/brightnessztl"

  # license
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
