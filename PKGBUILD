# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=2.6.4
pkgrel=1
_srcname=flux
_srcver=2.6.4
pkgdesc="Open and extensible continuous delivery solution for Kubernetes"
url="https://fluxcd.io/"
arch=("x86_64" "armv7h" "aarch64")
license=("APACHE")
optdepends=('bash-completion: auto-completion for flux in Bash'
            'zsh-completions: auto-completion for flux in ZSH')
source_x86_64=(
  "${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_amd64.tar.gz"
)
source_armv7h=(
  "${pkgname}-${pkgver}_linux_arm.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_arm.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_arm64.tar.gz"
)
sha256sums_x86_64=(
  9d3e21ad53baa0d5a062e1bd6f1a22d18b95906c682845bca9ffa272cff8a590
)
sha256sums_armv7h=(
  eb8bd66939ad160215462ec3646299a4876c94f9755cc06a77b151783f87e90f
)
sha256sums_aarch64=(
  674e605f527841bb9b50a692b3ce497752cfc81438f85b4d1523d86aca637353
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

    "${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
    "${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
    "${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
