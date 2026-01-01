# Maintainer: dan361 <daniel@m8t.io>
pkgname=kyverno-chainsaw-bin
pkgver=0.2.14
pkgrel=1
pkgdesc="Declarative K8s e2e testing"
arch=('x86_64')
url="https://github.com/kyverno/chainsaw"
license=('Apache-2.0')
provides=('kyverno-chainsaw')
conflicts=('kyverno-chainsaw')
source=(
  "https://github.com/kyverno/chainsaw/releases/download/v${pkgver}/chainsaw_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/kyverno/chainsaw/refs/heads/main/LICENSE"
)
sha256sums=('f2f4a3f9a541d65db12f5c910950758f7d56fae20ad5b1272cdc271c9568443e'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
  cd "${srcdir}"
  install -Dm755 chainsaw "${pkgdir}/usr/bin/chainsaw"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
