# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=skaffold-bin
reponame=skaffold
provides=('skaffold')
conflicts=('skaffold')
pkgver=1.37.2
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${reponame}"
license=("Apache")
depends=("docker")
optdepends=(
  "minikube: To use Minikube"
  "kubectl: For Kubernetes support"
  "bash-completion: Tab autocompletion"
)

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('5028755d1e8e5bd87b4185785b9c490002862bf62d75f76f45c91ff6fea0a0ab');;
  aarch64)   _CARCH=arm64 && sha256sums=('e86c1e0d053bcfea10d1853eb31f39a796cade685dd74bf75a8803be8c044189');;
esac

source=("${reponame}-${pkgver}-${_CARCH}::https://github.com/GoogleContainerTools/skaffold/releases/download/v$pkgver/skaffold-linux-${_CARCH}")

package() {
  install -Dm 0755 ${reponame}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/skaffold"
}
