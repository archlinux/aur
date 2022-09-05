# Maintainer: Kien Dang <mail at kien dot ai>
# Contributor: Chuah Chee Shian <shian15810@gmail.com>

pkgname=scala-cli
pkgver=0.1.12
pkgrel=1
pkgdesc='Scala CLI is a command-line tool to interact with the Scala language.'
arch=('x86_64')
url='https://scala-cli.virtuslab.org'
license=('Apache')
depends=()
source=("https://github.com/VirtusLab/scala-cli/releases/download/v$pkgver/scala-cli-$CARCH-pc-linux.gz")
sha256sums=('fc098bf665a2d8eadd18deeaa96447558412eb54d4c50bc5f4796bee9e9b0ec6')

package() {
  SCALA_CLI="$srcdir/scala-cli-$CARCH-pc-linux"

  install -Dm755 "$SCALA_CLI" "$pkgdir/usr/bin/scala-cli"
  install -Dm644 <("$SCALA_CLI" install completions --format bash --env) "$pkgdir/usr/share/bash-completion/completions/scala-cli"
  install -Dm644 <("$SCALA_CLI" install completions --format zsh --env) "$pkgdir/usr/share/zsh/site-functions/_scala-cli"
}
