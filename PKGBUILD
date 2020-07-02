# Maintainer: John Lane <archlinux at jelmail.com>

pkgname=kubergrunt-bin
pkgver=0.5.13
pkgrel=1
pkgdesc="A standalone go binary with a collection of commands that attempts to fill in the gaps between Terraform, Helm, and Kubectl for managing a Kubernetes Cluster."
url="https://github.com/gruntwork-io/kubergrunt"
conflicts=('kubergrunt')
provides=('kubergrunt')
license=('Apache')
arch=('x86_64')
source=(
  "https://raw.githubusercontent.com/gruntwork-io/kubergrunt/v${pkgver}/LICENSE"
  "kubergrunt_linux_amd64-${pkgver}::https://github.com/gruntwork-io/kubergrunt/releases/download/v${pkgver}/kubergrunt_linux_amd64"
)
sha256sums=('d1dc9a105a814822337e0f8eab8668e4eb05bb04b4d6b234c5e9b79b76550a91'
            'a794c33259d5ba201193b3aa9ec3d729740e46ed9eee8d34bc2fb6cb71a33ba1')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 755 "${srcdir}/${source[1]%%::*}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

# vim:set ts=2 sw=2 et:
