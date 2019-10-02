# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=hub-bin
pkgver=2.12.7
pkgrel=1
pkgdesc="A command-line tool that makes git easier to use with GitHub"
arch=('x86_64')
url="https://hub.github.com"
depends=('git')
license=('MIT')
source=("https://github.com/github/hub/releases/download/v${pkgver}/hub-linux-amd64-${pkgver}.tgz")
sha256sums=('5ba5ea455659f02c162553bc8b01fb8a6ccca3c21f8a80b054cce02ed28a36a2')

package() {
  prefix="${pkgdir}/usr" "${srcdir}/hub-linux-amd64-${pkgver}/install"

  install -Dm644 "${srcdir}/hub-linux-amd64-${pkgver}/etc/hub.bash_completion.sh" "$pkgdir/usr/share/bash-completion/completions/hub"
  install -Dm644 "${srcdir}/hub-linux-amd64-${pkgver}/etc/hub.zsh_completion" "$pkgdir/usr/share/zsh/site-functions/_hub"
  install -Dm644 "${srcdir}/hub-linux-amd64-${pkgver}/etc/hub.fish_completion" "$pkgdir/usr/share/fish/completions/hub.fish"
}
