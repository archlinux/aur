# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>

pkgname=twitch-cli-bin
pkgver=1.1.1
_filename="twitch-cli_${pkgver}_Linux_x86_64.tar.gz"
pkgrel=1
pkgdesc='The official Twitch CLI to make developing on Twitch easier.'
arch=('x86_64')
url=https://github.com/twitchdev/twitch-cli
license=('Apache')
source=("https://github.com/twitchdev/twitch-cli/releases/download/${pkgver}/$_filename")
sha256sums=('6443e5a3cd440ddd2821bdbe91847b0274d4e24b699a3a2d191b08d0e16ca271')

prepare () {
    cd "$srcdir"
    tar xzf "$_filename"
}

package() {
    cd "$srcdir"

    install -Dm755 twitch "$pkgdir/usr/bin/twitch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
