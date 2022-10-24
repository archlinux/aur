# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=mirrord-bin
pkgver=3.2.0
pkgrel=1
pkgdesc='Run your service in the context of your cloud environment.'
arch=('x86_64')
url='https://mirrord.dev/'
license=('MIT')
depends=()
makedepends=(
    'coreutils'
    'grep'
)
source=("mirrord::https://github.com/metalbear-co/mirrord/releases/download/${pkgver}/mirrord_linux_x86_64")
sha256sums=('749186d7312eb25a78fcf00277e3401faa87be2e1cf12e57135c232f4b5fd341')

pkgver() {
    curl -fsSL https://github.com/metalbear-co/mirrord/raw/latest/Cargo.toml | grep -m 1 version | cut -d' ' -f3 | tr -d '"'
}

package() {
    install -m 755 -D -t "${pkgdir}/usr/bin/" mirrord
}

