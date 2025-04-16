# Maintainer: Alexander Bauer <sasha at linux dot com>
# Contributor: Simon Weald <simon[at]simonweald[dot]com>

pkgname=flux2-bin
pkgdesc="CLI client for Flux2, the GitOps Kubernetes operator"
pkgver=2.5.1
pkgrel=1
arch=('x86_64')
url="https://github.com/fluxcd/flux2"
license=('Apache-2.0')
_archive=flux_${pkgver}_linux_amd64.tar.gz
_checksums=flux_${pkgver}_checksums.txt
_binary=flux
_srcname=flux
source=(
  "https://github.com/fluxcd/flux2/releases/download/v$pkgver/$_archive"
)

package() {
  install -Dm 755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/${_srcname}"

  "${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
  "${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
sha256sums=('f64c85db4b94aefcdf6e0f2825c32573fc2bd234e5489ff332fee62776973ec3')
