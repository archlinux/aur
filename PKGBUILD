# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tcmux'
pkgver=0.3.2
pkgrel=1
pkgdesc='tcmux is a terminal and coding agent mux viewer'
url='https://github.com/k1LoW/tcmux'

license=('MIT')
arch=('aarch64' 'x86_64')
depends=('tmux')
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('6688333761609d1f5848122332fae6956cc33d70f589e6afc2db1b663413d9f7')
sha256sums_x86_64=('421ddeaff1b0f6ed40e43da6d2019a5d97b38a5b0e60877e91c50e8091014bd7')

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
