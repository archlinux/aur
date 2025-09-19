# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecsta'
pkgver=0.7.1
pkgrel=1
pkgdesc='ECS Task Assistant tool'
url='https://github.com/fujiwara/ecsta'
license=('Apache')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('09247d9e67fd6b71f566a5b3377570ec324e8e561c74c72cf407caf676a05087')
sha256sums_x86_64=('6b37075bd67e6b8327b299ba280c82fec81253f402bb08f855eb6bbae7043a3e')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/ecsta "$pkgdir/usr/bin/ecsta"
}

check() {
  ${srcdir}/ecsta version
}
