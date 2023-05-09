# Maintainer: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=doppler-cli-bin
pkgver=3.59.0
pkgrel=1
pkgdesc="CLI utility for Doppler, environment and secrets manager."
arch=("x86_64")
license=('Apache')
depends=()
url=https://doppler.com
source=("$pkgname.$pkgver.tar.gz::https://cli.doppler.com/download?os=linux&arch=amd64&format=tar")
sha256sums=('309dbdd9e1acfb3bb6f8bcfe13f241024eac313ffc52be679c7329b5a031d69a')
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
