# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=krust-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Latency-first Kubernetes terminal navigator for multi-cluster operators"
arch=('x86_64')
url="https://github.com/ErfanY/krust"
license=('MIT')
depends=('libgcc' 'glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_triple=x86_64-unknown-linux-gnu
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/krust-${_triple}.tar.gz")
sha256sums_x86_64=('982dfee1bc969a47af612354e2b2d966ae600b612dff86ef240a3852836f07d6')

package() {
  cd "krust-${_triple}"
  install -Dm755 krust "${pkgdir}/usr/bin/krust"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
