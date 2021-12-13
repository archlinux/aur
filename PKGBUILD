# Maintainer: Chuah Chee Shian <shian15810@gmail.com>

pkgname=scala-cli
pkgver=0.0.9
pkgrel=1
pkgdesc='Scala CLI is a command-line tool to interact with the Scala language.'
arch=('x86_64')
url='https://scala-cli.virtuslab.org'
license=('Apache')
depends=('java-runtime-headless>=8')
source=("https://github.com/VirtusLab/scala-cli/releases/download/v$pkgver/scala-cli-x86_64-pc-linux.gz")
sha256sums=('2035cef8c8059674fb54fba0710aff2062d9783fef585a89d03d335486d3b64e')

package() {
  install -Dm755 "$srcdir/scala-cli-x86_64-pc-linux" "$pkgdir/usr/bin/scala-cli"
  install -Dm644 <("$srcdir/scala-cli-x86_64-pc-linux" install completions --format bash --env) "$pkgdir/usr/share/bash-completion/completions/scala-cli"
  install -Dm644 <("$srcdir/scala-cli-x86_64-pc-linux" install completions --format zsh --env) "$pkgdir/usr/share/zsh/site-functions/_scala-cli"
}
