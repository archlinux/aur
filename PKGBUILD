# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.11.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/swsnr/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2625bf54ad3dae223536c39a7ba7c165b923c68fda87f19cd0476c671b8b1b48')

build() {
    cd "${pkgname}-${pkgver}" || exit 1
    export RUSTFLAGS='--cap-lints=allow'
    make PREFIX="/usr" build
}

package() {
    cd "${pkgname}-${pkgver}" || exit 1
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
