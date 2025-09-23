# Maintainer: Andres Morey <andres@kubetail.com>

pkgname=kubetail-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="Real-time logging dashboard for Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/kubetail-org/kubetail"
license=('apache')
depends=()
provides=('kubetail')
conflicts=('kubetail')

source_x86_64=("https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv${pkgver}/kubetail-linux-amd64")
source_aarch64=("https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv${pkgver}/kubetail-linux-arm64")

sha256sums_x86_64=('44d8c9890dc6cdc4b276ad5c69bb594b8b84b99dd6be1cedd67f91165653d163')
sha256sums_aarch64=('d5eab8ec73ba61618d84b7c63baa3195588cb1fa6dc070cb179dd96bd46fbc60')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubetail"

  "${pkgdir}/usr/bin/kubetail" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubetail"
  "${pkgdir}/usr/bin/kubetail" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubetail"
}
