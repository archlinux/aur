# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=concordium-client-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A command-line client to interact with a Concordium node"
arch=('x86_64')
url="https://github.com/Concordium/concordium-client"
license=('APACHE')
source=("https://distribution.concordium.software/tools/linux/concordium-client_${pkgver}")
sha256sums=('bae20cf3bc93dbafc58a7b1eae462375ef3cfba2cc4905bf872735aa8233d98c')

package() {
  install -Dm755 concordium-client_${pkgver} "${pkgdir}/usr/bin/concordium-client" 

  "${pkgdir}/usr/bin/concordium-client" --bash-completion-script /usr/bin/concordium-client | install -Dm644 /dev/stdin  "${pkgdir}/usr/share/bash-completion/completions/concordium-client"
  "${pkgdir}/usr/bin/concordium-client" --zsh-completion-script /usr/bin/concordium-client | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_concordium-client"
  "${pkgdir}/usr/bin/concordium-client" --fish-completion-script /usr/bin/concordium-client | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/concordium-client.fish"
}
