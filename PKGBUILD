# Maintainer: Madison Lynch <madi@mxdi.xyz>
pkgname=rah-bin
_pkgname=rah
pkgver=2.0.1
pkgrel=2
pkgdesc="A simple AUR helper written in Rust"

arch=(x86_64)
url=https://deadgirl.dev/projects/rah
license=(MIT)

depends=(pacman)
conflicts=(rah)

source=("${_pkgname}-${pkgver}-amd64.tar.gz::https://deadgirl.dev/projects/rah/releases/${_pkgname}-${pkgver}-amd64.tar.gz")
options=(!lto)
md5sums=(SKIP)

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    install -Dm755 "./rah" "$pkgdir/usr/bin/rah"
    install -Dm644 "./rah.8" "$pkgdir/usr/man/man8/rah.8"
}