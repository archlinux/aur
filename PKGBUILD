# Maintainer: r6eve <r6eve at acm dot org>

pkgname=tmux-tanlog-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Save all console outputs into files'
arch=('x86_64')
url='https://github.com/r6eve/tmux-tanlog'
license=('Boost')
depends=('tmux' 'zsh')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}"::"${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-${CARCH}-unknown-linux-musl")
noextract=("${pkgname}-${pkgver}")
sha256sums=('fa23c16b70ea3a1ca647067df21a652dbb2e0a57dc337b0d2d44e57105c12682')

package() {
  mv "${pkgname}-${pkgver}" "${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
