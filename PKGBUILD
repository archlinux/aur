# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=hub-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="A command-line tool that makes git easier to use with GitHub"
arch=('x86_64')
url="https://hub.github.com"
depends=('git')
license=('MIT')
source=("https://github.com/github/hub/releases/download/v${pkgver}/hub-linux-amd64-${pkgver}.tgz")
sha256sums=('48b7a3da8c54c1373848074c59a2233c4874f68ed362fc8d3d251423d02496fe')

package() {
  prefix="${pkgdir}/usr" "${srcdir}/hub-linux-amd64-${pkgver}/install"

  install -Dm644 "${srcdir}/hub-linux-amd64-${pkgver}/etc/hub.bash_completion.sh" "$pkgdir/usr/share/bash-completion/completions/hub"
  install -Dm644 "${srcdir}/hub-linux-amd64-${pkgver}/etc/hub.zsh_completion" "$pkgdir/usr/share/zsh/site-functions/_hub"
  install -Dm644 "${srcdir}/hub-linux-amd64-${pkgver}/etc/hub.fish_completion" "$pkgdir/usr/share/fish/completions/hub.fish"
}
