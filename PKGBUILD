# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecspresso-bin'
pkgver=2.3.5
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
sha256sums_aarch64=('496ee0295a51e18f6862e485a45049f14a64cd1ff8eb4c0f30d8bc9f8aa60ac4')
sha256sums_x86_64=('f4da7ff630a262dbc426895078edbfd1e27e6aa6418e10c187b2c166a15950d2')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${_execname} "$pkgdir/usr/bin/${_execname}"
}

check() {
  ${srcdir}/${_execname} version
}
