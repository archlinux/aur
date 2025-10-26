# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecsta'
pkgver=0.7.3
pkgrel=1
pkgdesc='ECS Task Assistant tool'
url='https://github.com/fujiwara/ecsta'
license=('Apache')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('873dfaa6444fb98085138b6e0b97df1bd610aa63bd5b3bb26b5d071539bcb68a')
sha256sums_x86_64=('b0592d465dd59a47c19240512746685b24c668033cebd15c76059ee97b6bb044')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/ecsta "$pkgdir/usr/bin/ecsta"
}

check() {
  ${srcdir}/ecsta version
}
