# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecspresso-bin'
pkgver=2.4.6
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
sha256sums_aarch64=('1e37b8f3ec290c6210bac110f8ce291ad8bc2b96a3cb299ab58d4ab27c1b0db3')
sha256sums_x86_64=('eabe69c527e23c2cf29ec52b0735a664f166b39465b21dbc6a327ddf280efe1c')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/${_execname} "$pkgdir/usr/bin/${_execname}"
}

check() {
  ${srcdir}/${_execname} version
}
