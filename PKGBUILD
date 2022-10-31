# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=mirrord-bin
pkgver=3.4.0
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
sha256sums=('2f7d1b3a6d6fe5299a1de793b8a4a41a56291f7f722eeb7078f3013e61848401')

pkgver() {
    curl -fsSL https://github.com/metalbear-co/mirrord/raw/latest/Cargo.toml | grep -m 1 version | cut -d' ' -f3 | tr -d '"'
}

package() {
    install -m 755 -D -t "${pkgdir}/usr/bin/" mirrord
}

