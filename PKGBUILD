# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecspresso-bin'
pkgver=2.8.7
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
sha256sums_aarch64=('70b50006b4a9507112e14e72b45cabc2ccefa32b5a88bb4084d8026883a500cb')
sha256sums_x86_64=('88e9573b48b020db810e458ee6cff16b54061f984c573f940da4d6408eb38d82')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${_execname} "$pkgdir/usr/bin/${_execname}"
}

check() {
  ${srcdir}/${_execname} version
}
