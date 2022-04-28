# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=kubergrunt
pkgver=0.9.0
pkgrel=3
pkgdesc="Kubergrunt is a standalone go binary with a collection of commands to fill in the gaps between Terraform, Helm, and Kubectl"
arch=('x86_64')
url="https://github.com/gruntwork-io/kubergrunt"
optdepends=('terraform' 
            'kubectl' 
            'helm'
          )
license=('Apache-2')
source=(
  "https://raw.githubusercontent.com/gruntwork-io/kubergrunt/v${pkgver}/LICENSE"
  "https://github.com/gruntwork-io/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_amd64")
sha256sums=('d1dc9a105a814822337e0f8eab8668e4eb05bb04b4d6b234c5e9b79b76550a91'
            '279f895eb9b29595ae795a6e7587ade6a8a3b95c74b4497ce795f75da20793ef')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}_linux_amd64 ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
