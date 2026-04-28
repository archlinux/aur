# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecspresso-bin'
pkgver=2.8.3
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
sha256sums_aarch64=('eaff105cdfff563fb1c4ee34b7754b1559214c8f185ffd533d78d814db068b0d')
sha256sums_x86_64=('2bd4ec3364924fd974aaead5791a9fcad3f4d1b9a30bf01b0a4f042ebac79ab0')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${_execname} "$pkgdir/usr/bin/${_execname}"
}

check() {
  ${srcdir}/${_execname} version
}
