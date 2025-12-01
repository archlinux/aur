# Maintainer: grimsteel <admin at vocabustudy dot org>
pkgname=usaco-cli-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A command line tool for USACO"
url="https://github.com/grimsteel/usaco-cli"
arch=("x86_64")
license=("GPL-3.0-or-later")
optdepends=("org.freedesktop.secrets: encrypted credential backend")
source=(
    "https://github.com/grimsteel/usaco-cli/releases/download/v$pkgver/usaco-x86_64-unknown-linux-gnu"
)
sha256sums=('fd35635e166e315fd253651655fd86250d0e83bd75b99ca3fe866445fcbde013')


package() {
  install -Dm 755 "${srcdir}/usaco-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/usaco"
  # generate bash completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  "${pkgdir}/usr/bin/usaco" completion bash > "${pkgdir}/usr/share/bash-completion/completions/usaco"
}
