# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=doppler-cli-bin
pkgver=3.67.1
pkgrel=3
pkgdesc="CLI utility for Doppler, environment and secrets manager."
arch=("x86_64")
license=('Apache')
depends=()
url=https://doppler.com
source=("$pkgname.$pkgver.tar.gz::https://github.com/DopplerHQ/cli/releases/download/${pkgver}/doppler_${pkgver}_linux_amd64.tar.gz")
sha256sums=('375ccc518f5eb1a474dd9302d24e235bd3f7aec4f6d039cf31b7f9fe1905bec5')
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
