# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=fluxctl-bin
pkgdesc="CLI client for Flux, the GitOps Kubernetes operator"
pkgver=1.25.0
pkgrel=1
arch=('x86_64')
url="https://github.com/fluxcd/flux"
license=('apache')
_binary=fluxctl_linux_amd64
_srcname=fluxctl
source=("$_binary-$pkgver::https://github.com/fluxcd/flux/releases/download/$pkgver/$_binary")
sha256sums=('5c02d23d545c8f6a4db85f07f1fa07c1c35d29f66de50a79d150ca8c85f3e978')

package() {
  install -Dm 755 "${srcdir}/${_binary}-${pkgver}" "${pkgdir}/usr/bin/${_srcname}"

  "${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
  "${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
