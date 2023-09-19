# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>
# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=2.1.1
pkgrel=1
_srcname=flux
_srcver=2.1.1
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
  29cb2bf548fe99c3eddc034b9c267e1b02bda8792b3f0151e2b2f9f64709a9b5
)
sha256sums_armv7h=(
  6617a1ee1f4dddee147f6bc8c82a92f827813f91745dec3595f00c28bf3b9636
)
sha256sums_aarch64=(
  0fb10150abea11f592ad3ae394f80a6c024b42d87af16bd9124adb9347e78ebb
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

    "${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
    "${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
    "${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
