# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

pkgname=shuck-bin
pkgdesc='A lightning fast shell linter/formatter/LSP server'
pkgver=0.2.11
pkgrel=1
url='https://ewhauser.github.io/shuck/'
arch=('x86_64')
license=('MIT')
depends=('libgcc')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!debug' '!strip')
source_x86_64=("shuck-cli-v${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/ewhauser/shuck/releases/download/v${pkgver}/shuck-cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('7cf0a7811bae7c33dad70c0affa4f766c413766782090c9d37197d853bc7c5da')

package() {
  cd "${srcdir}/shuck-cli-x86_64-unknown-linux-gnu"
  install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
