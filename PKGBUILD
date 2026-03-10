# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tcmux'
pkgver=0.4.0
pkgrel=1
pkgdesc='tcmux is a terminal and coding agent mux viewer'
url='https://github.com/k1LoW/tcmux'

license=('MIT')
arch=('aarch64' 'x86_64')
depends=('tmux')
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('14f3aea409a445cc6a11a7900d17a59f6f7b0f39f7c1402b73fa50536167a754')
sha256sums_x86_64=('9870f9939818c503b1d679eb6731fe113544ed0164f5328f7f57883a1f1dcbb4')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/CHANGELOG.md "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 ${srcdir}/CREDITS "$pkgdir/usr/share/doc/${pkgname}/CREDITS"

  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${pkgname} "$pkgdir/usr/bin/${pkgname}"
}

check() {
  ${srcdir}/${pkgname} --help
}
