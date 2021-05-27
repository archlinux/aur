# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Open and extensible continuous delivery solution for Kubernetes"
url="https://fluxcd.io/"
arch=("x86_64" "armv6h" "armv7h" "aarch64")
license=("APACHE")
optdepends=('kubectl: for apply actions on the Kubernetes cluster',
'bash-completion: auto-completion for flux in Bash',
'zsh-completions: auto-completion for flux in ZSH')
source_x86_64=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_amd64.tar.gz"
)
source_armv6h=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_arm.tar.gz"
)
source_armv7h=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_arm.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_arm64.tar.gz"
)
sha256sums_x86_64=(
  73f81a3278f0b1659296d95dc5a357a4f7f601139ff899e51f386853eaf1585e
)
sha256sums_armv6h=(
  b5e33ec2f59a0a71ab3c1e7b379cc5515fb3b75e2ffd216fbab235907461f688
)
sha256sums_armv7h=(
  b5e33ec2f59a0a71ab3c1e7b379cc5515fb3b75e2ffd216fbab235907461f688
)
sha256sums_aarch64=(
  dd740fb16864470ae50db13ecaad6915fede7665f59a174ec4528fd8a5027eb7
)
_srcname=flux

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

    "${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
    "${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
    "${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
