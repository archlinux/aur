# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecsta'
pkgver=0.4.3
pkgrel=1
pkgdesc='ECS Task Assistant tool'
url='https://github.com/fujiwara/ecsta'
license=('Apache')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('991acd3113190075405d290fe1e07a8910109cf37d1ae6a8bf6423d730aef36a')
sha256sums_x86_64=('2831e77aaaf7ff745a2c3ad552177b8680d3381dc1def18c5aabe5600f9dcbef')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/ecsta "$pkgdir/usr/bin/ecsta"
}

check() {
  ${srcdir}/ecsta version
}
