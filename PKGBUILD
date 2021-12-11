# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>

pkgname=twitch-cli-bin
pkgver=1.1.5
_filename="twitch-cli_${pkgver}_Linux_x86_64.tar.gz"
pkgrel=1
pkgdesc='The official Twitch CLI to make developing on Twitch easier.'
arch=('x86_64')
url=https://github.com/twitchdev/twitch-cli
license=('Apache')
source=("https://github.com/twitchdev/twitch-cli/releases/download/v${pkgver}/$_filename")
sha256sums=('b944ff4f87560c5340974bd695246ef1f202d6a24f9102ba423040ba7e75ecba')

prepare () {
    cd "$srcdir"
    tar xzf "$_filename"
}

package() {
    cd "$srcdir"

    install -Dm755 twitch "$pkgdir/usr/bin/twitch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
