# Maintainer: Shorin <2433516202@qq.com>

_pkgname=wl-wordlens
pkgname=wl-wordlens-git
pkgver=r6.g9ca31b0
pkgrel=1
pkgdesc="Wayland screenshot translation tool using vision language models"
arch=('any')
url="https://github.com/SHORiN-KiWATA/wl-wordlens"
license=('custom')
depends=(
    'grim'
    'gtk4'
    'python'
    'python-gobject'
    'python-markdown-it-py'
    'python-requests'
    'slurp'
)
makedepends=('git')
optdepends=('vim: edit multi-line prompts and API keys with the default editor')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"

    install -Dm755 wl-wordlens "$pkgdir/usr/bin/wl-wordlens"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
