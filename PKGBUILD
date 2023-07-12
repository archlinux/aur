# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=doppler-cli-bin
pkgver=3.65.0
pkgrel=3
pkgdesc="CLI utility for Doppler, environment and secrets manager."
arch=("x86_64")
license=('Apache')
depends=()
url=https://doppler.com
source=("$pkgname.$pkgver.tar.gz::https://github.com/DopplerHQ/cli/releases/download/${pkgver}/doppler_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d66d28e4f77468b295252742de3338cd4d57fd142afa56f3d9f96a5135832902')
_sourcedir=(".")

package() {
    local dataopts='--mode 0644 -D --target-directory'
    local binopts='--mode 0755 -D --target-directory'
    local bindir="$pkgdir/usr/bin"
    local shrdir="$pkgdir/usr/share"
    local licdir="$shrdir/licenses/$pkgname"
    local docdir="$shrdir/doc/$pkgname"
    install $dataopts $licdir "$_sourcedir/LICENSE"
    install $dataopts $docdir "$_sourcedir/README.md"
    install $binopts $bindir "$_sourcedir/doppler"
}
