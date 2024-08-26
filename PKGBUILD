# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecsta'
pkgver=0.6.0
pkgrel=1
pkgdesc='ECS Task Assistant tool'
url='https://github.com/fujiwara/ecsta'
license=('Apache')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('6201e78a10862491ad580cf14517ab731487a0f3a920fd18d9ade68151a28d21')
sha256sums_x86_64=('b502d38504a6045aeed064970040100c9099d3f3fc02f334b22457bddef48d5a')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/ecsta "$pkgdir/usr/bin/ecsta"
}

check() {
  ${srcdir}/ecsta version
}
