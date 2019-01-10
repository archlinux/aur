# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=hexyl-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A command-line hex viewer"
arch=('x86_64')
url="https://github.com/sharkdp/hexyl"
license=('Apache' 'MIT')
conflicts=('hexyl')

source=("${url}/releases/download/v${pkgver}/hexyl-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('eff0fa45e27a73b9e2ff594a06ce7646d59288d969657b14fa33c5d931796be1')

package() {
  cd "${srcdir}/hexyl-v${pkgver}-x86_64-unknown-linux-musl/"
  install -D -m755 hexyl "${pkgdir}/usr/bin/hexyl"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
