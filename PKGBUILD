# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=2.0.1
pkgrel=1
_srcname=flux
_srcver=2.0.1
pkgdesc="Open and extensible continuous delivery solution for Kubernetes"
url="https://fluxcd.io/"
arch=("x86_64" "armv6h" "armv7h" "aarch64")
license=("APACHE")
optdepends=('bash-completion: auto-completion for flux in Bash'
            'zsh-completions: auto-completion for flux in ZSH')
source_x86_64=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_amd64.tar.gz"
)
source_armv6h=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_arm.tar.gz"
)
source_armv7h=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_arm.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_arm64.tar.gz"
)
sha256sums_x86_64=(
  bff7a54421a591eaae0c13d1f7bd6420b289dd76d0642cb3701897c9d02c6df7
)
sha256sums_armv6h=(
  099b2dc2e7005f03d2a645ee2212f26812141db2f39fd22c6927e4ecb327064f
)
sha256sums_armv7h=(
  099b2dc2e7005f03d2a645ee2212f26812141db2f39fd22c6927e4ecb327064f
)
sha256sums_aarch64=(
  efa801d345494b2e4595b73c336687b97413f40e42e8b769c65f98dfe5416e3b
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

    "${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
    "${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
    "${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
