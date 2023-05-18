# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=skaffold-bin
reponame=skaffold
provides=('skaffold')
conflicts=('skaffold')
pkgver=2.4.1
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${reponame}"
license=("Apache")
optdepends=(
  "docker: One of tools for building images support by skaffold"
  "minikube: To use Minikube"
  "kubectl: One of tools for deploying applications support by skaffold"
  "bash-completion: Tab autocompletion"
)

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('5a5f147c6262263b6f30790673c89d63f44732c33d7eb472eb99248d883650eb');;
  aarch64)   _CARCH=arm64 && sha256sums=('367973b2a77cc0670ff1ad82f5640c1daddb2fdeff406b498788b3c0ab320a5d');;
esac

source=("${reponame}-${pkgver}-${_CARCH}::https://github.com/GoogleContainerTools/skaffold/releases/download/v$pkgver/skaffold-linux-${_CARCH}")

package() {
  install -Dm 0755 ${reponame}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/skaffold"
}
