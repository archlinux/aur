# Maintainer: ghostgamer <arambhmani@hotmail.com>

pkgname=por-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="A cli to browse and watch porn."
arch=('any')
url="https://github.com/por-cli/por-cli"
license=('GPL-3.0-or-later')
depends=(
    'bash'
    'curl'
    'fzf'
    'mpv'
    'chafa'
    'jq'
    'sed'
    'grep'
    'gawk'
    'coreutils'
    'libnotify'
    'yt-dlp'
    'xdg-utils'
)

optdepends=(
    'kitty: terminal video playback'
)
conflicts=('por-cli-git')
source=( "$pkgname-$pkgver.tar.gz::https://github.com/por-cli/por-cli/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('bca6a87a4e809efed8b043f17152aecaebd21b5617a9a8571cbca145ab493305')

package() {
    cd "$srcdir/por-cli-$pkgver"

    install -Dm755 por-cli "$pkgdir/usr/bin/por-cli"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

