# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=hexyl-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A command-line hex viewer"
arch=('x86_64')
url="https://github.com/sharkdp/hexyl"
license=('Apache' 'MIT')
provides=('hexyl')
conflicts=('hexyl')

source=(
  "${url}/releases/download/v${pkgver}/hexyl-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
)
sha256sums=(
  '13b703a6f7461e95763ddb45d34f8a75981106275c09e1d004067fe9b57ee12f'
)

package() {
  cd "${srcdir}/hexyl-v${pkgver}-x86_64-unknown-linux-musl/"
  install -D -m755 hexyl "${pkgdir}/usr/bin/hexyl"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
