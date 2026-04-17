# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecspresso-bin'
pkgver=2.8.1
pkgrel=1
pkgdesc='ecspresso is a deployment tool for Amazon ECS'
url='https://github.com/kayac/ecspresso'

_execname='ecspresso'
license=('MIT')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname%%-bin}_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('bb178370081fe52dbfc2eaad938b147246874a782e6f17a5dfbdeaad84852392')
sha256sums_x86_64=('521dd3689c9e4482d6073c940b6b387ef9561144f750fdd92e33d5b7f9a03427')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${_execname} "$pkgdir/usr/bin/${_execname}"
}

check() {
  ${srcdir}/${_execname} version
}
