# Maintainer: dan361 <daniel@m8t.io>
pkgname=kyverno-chainsaw-bin
pkgver=0.2.13
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
sha256sums=('6c8d4cdccacbea7100a8354893b3176d874eecfe70c930fbe0496b7967d61ca4'
  'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
  cd "${srcdir}"
  install -Dm755 chainsaw "${pkgdir}/usr/bin/chainsaw"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
