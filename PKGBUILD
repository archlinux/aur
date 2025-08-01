# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=2.5.3
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://codeberg.org/swsnr/gnome-search-providers-vscode"
license=('EUPL-1.2')
depends=('sqlite')
makedepends=('rust' 'just' 'git')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('aa910f15364fb50e9e28ab80401f13d764be293a3ae34386aad6579dca138b4f')

build() {
    cd "${pkgname}" || exit 1
    cargo build --release
}

package() {
    cd "${pkgname}" || exit 1
    just destdir="${pkgdir}" prefix="/usr" install
}
