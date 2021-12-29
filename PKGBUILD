# Maintainer: Ayrton Araujo <ayrton@linux.com>

pkgname=argocd-bin
_pkgname=argocd
pkgver=2.2.1
pkgrel=2
pkgdesc="Argo CD: Declarative continuous deployment for Kubernetes."
arch=('x86_64')
url="https://github.com/argoproj/argo-cd"
license=('Apache')
source=("${_pkgname}_${pkgver}::https://github.com/argoproj/argo-cd/releases/download/v${pkgver}/${_pkgname}-linux-amd64")

package() {
  install -Dm755 "${_pkgname}_$pkgver" "$pkgdir/usr/bin/${_pkgname}"
  $pkgdir/usr/bin/${_pkgname} completion zsh > ${_pkgname}.zsh
  $pkgdir/usr/bin/${_pkgname} completion bash > ${_pkgname}.bash
  install -Dm644 ${_pkgname}.zsh "$pkgdir/usr/share/zsh/site-functions/_${_pgkname}"
  install -Dm644 ${_pkgname}.bash "$pkgdir/usr/share/bash-completion/completions/_${_pkgname}"
}

sha256sums=('08a899143120724be4694e1760c984b281448125debf7f7725ce021772f84cdf')
