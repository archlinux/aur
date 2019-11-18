# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=hub-bin
pkgver=2.13.0
pkgrel=1
pkgdesc="A command-line tool that makes git easier to use with GitHub"
arch=('x86_64')
url="https://hub.github.com"
depends=('git')
license=('MIT')
source=("https://github.com/github/hub/releases/download/v${pkgver}/hub-linux-amd64-${pkgver}.tgz")
sha256sums=('e0f117d553f771938ee594ef280e1b2edf3feebab7c7cb55eab0240a76928652')

package() {
  prefix="${pkgdir}/usr" "${srcdir}/hub-linux-amd64-${pkgver}/install"

  install -Dm644 "${srcdir}/hub-linux-amd64-${pkgver}/etc/hub.bash_completion.sh" "$pkgdir/usr/share/bash-completion/completions/hub"
  install -Dm644 "${srcdir}/hub-linux-amd64-${pkgver}/etc/hub.zsh_completion" "$pkgdir/usr/share/zsh/site-functions/_hub"
  install -Dm644 "${srcdir}/hub-linux-amd64-${pkgver}/etc/hub.fish_completion" "$pkgdir/usr/share/fish/completions/hub.fish"
}
