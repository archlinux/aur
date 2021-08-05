# Maintainer: Oliver Breitwieser <oliver@breitwieser.eu>

_pkgname=asfa
pkgname=${_pkgname}-bin
pkgver=0.9.0
pkgrel=2
pkgdesc='share files by upload via ssh and generation of a non-guessable link (pre-built)'
url="https://github.com/obreitwi/asfa"
license=("MIT")
arch=("x86_64")
provides=("asfa")
conflicts=("asfa")
depends=('gcc-libs' 'openssl' 'zlib')
_archive_name="${_pkgname}-v$pkgver-x86_64-unknown-linux-gnu"
source=("https://github.com/obreitwi/asfa/releases/download/v$pkgver/${_archive_name}.tar.gz")
sha256sums=("22e18371253f92b0c28e3614c00f850fe73f1f41346a5d77be8398a303cbdad5")


package() {
    cd "${_archive_name}"
    install -Dm755 asfa -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    find man/man1 -type f -print0 \
        | xargs -0 install -Dm644 -t "$pkgdir/usr/share/man/man1"
}
