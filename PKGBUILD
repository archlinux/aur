# kubecfg-bin

# Maintainer: dmrz < user on aur.archlinux.org >

pkgname=kubecfg-bin
pkgver=0.29.2
pkgrel=1
pkgdesc="A tool for managing complex enterprise Kubernetes environments as code"
url="https://github.com/kubecfg/kubecfg"
license=('Apache')
arch=('x86_64')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}::https://github.com/kubecfg/kubecfg/releases/download/v${pkgver}/kubecfg_Linux_X64")
md5sums=('SKIP')

package() {
  install -Dm755 "${srcdir}"/kubecfg* "${pkgdir}/usr/bin/kubecfg"

  "$pkgdir/usr/bin/kubecfg" completion --shell bash |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kubecfg"
  "$pkgdir/usr/bin/kubecfg" completion --shell zsh |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kubecfg"
}
