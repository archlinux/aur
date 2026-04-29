# Maintainer: Pierre Le Gall

pkgname=dexter-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A fast, full-featured Elixir LSP optimized for large Elixir codebases"
arch=('x86_64' 'aarch64')
url="https://github.com/remoteoss/dexter"
license=('MIT')
depends=('sqlite')
provides=('dexter')
conflicts=('dexter')

source_x86_64=("dexter_Linux_x86_64-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/dexter_Linux_x86_64.tar.gz")
source_aarch64=("dexter_Linux_arm64-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/dexter_Linux_arm64.tar.gz")

sha256sums_x86_64=('78582a890739937332decd00c0b8553512f1ad526f3c414fd6d654aaebb8a2e6')
sha256sums_aarch64=('c387f4dc14c4d6cf9c9fbd91c2ef16e0f2530c54617900635b11a4e1fe3cf2ae')

package() {
    case "$CARCH" in
        x86_64)  install -Dm755 dexter_Linux_x86_64/dexter "$pkgdir/usr/bin/dexter" ;;
        aarch64) install -Dm755 dexter_Linux_arm64/dexter  "$pkgdir/usr/bin/dexter" ;;
    esac
}
