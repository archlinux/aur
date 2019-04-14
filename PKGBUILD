# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=hexyl-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A command-line hex viewer"
arch=('x86_64')
url="https://github.com/sharkdp/hexyl"
license=('Apache' 'MIT')
provides=('hexyl')
conflicts=('hexyl')

source=("${url}/releases/download/v${pkgver}/hexyl-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('dc38b1deabdf4ffd194c56ea469fa40b172c05e645d5d97e60eb72a4630b65c3')

package() {
  cd "${srcdir}/hexyl-v${pkgver}-x86_64-unknown-linux-musl/"
  install -D -m755 hexyl "${pkgdir}/usr/bin/hexyl"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
