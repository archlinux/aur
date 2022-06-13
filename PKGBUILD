# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=skaffold-bin
reponame=skaffold
provides=('skaffold')
conflicts=('skaffold')
pkgver=1.37.1
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
  x86_64)    _CARCH=amd64 && sha256sums=('d45858e4b539188468724a703173f88dd9b7ba199a5ae326aa13ff136045b945');;
  aarch64)   _CARCH=arm64 && sha256sums=('aff259f2336d1090cd34c129fb0f894ace50ed34abd4fd262f4fe6ded585bc88');;
esac

source=("${reponame}-${pkgver}-${_CARCH}::https://github.com/GoogleContainerTools/skaffold/releases/download/v$pkgver/skaffold-linux-${_CARCH}")

package() {
  install -Dm 0755 ${reponame}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/skaffold"
}
