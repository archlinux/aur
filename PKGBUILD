# Maintainer: ghostgamer <arambhmani@hotmail.com>

pkgname=por-cli-git
pkgver=r42.2edfaac
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
    'yt-dlp'
    'jq'
    'sed'
    'grep'
    'gawk'
    'coreutils'
    'libnotify'
)
optdepends=(
    'xdg-utils: opening donation links in a browser'
    'kitty: terminal video playback with -t'
)
source=("por-cli::git+https://github.com/por-cli/por-cli.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/por-cli"
    printf 'r%s.%s' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/por-cli"

    install -Dm755 por-cli "$pkgdir/usr/bin/por-cli"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
