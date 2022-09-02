# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>

pkgname=twitch-cli-bin
pkgver=1.1.7
_filename="twitch-cli_${pkgver}_Linux_x86_64.tar.gz"
pkgrel=1
pkgdesc='The official Twitch CLI to make developing on Twitch easier.'
arch=('x86_64')
url=https://github.com/twitchdev/twitch-cli
license=('Apache')
source=("https://github.com/twitchdev/twitch-cli/releases/download/v${pkgver}/$_filename")
sha256sums=('df911b7102a2123c549e73e328ce302daead11ae51aef3bd04ea14fe5014cc60')

prepare () {
    cd "$srcdir"
    tar xzf "$_filename"
}

package() {
    cd "$srcdir/twitch-cli_${pkgver}_Linux_x86_64"

    install -Dm755 twitch "$pkgdir/usr/bin/twitch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
