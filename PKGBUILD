# Maintainer: Oliver Breitwieser <oliver@breitwieser.eu>

_pkgname=asfa
pkgname=${_pkgname}-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='share files by upload via ssh and generation of a non-guessable link (pre-built)'
url="https://github.com/obreitwi/asfa"
license=("MIT")
arch=("x86_64")
provides=("asfa")
conflicts=("asfa")
depends=('gcc-libs' 'openssl' 'zlib')
_archive_name="${_pkgname}-v$pkgver-x86_64-unknown-linux-gnu"
source=("https://github.com/obreitwi/asfa/releases/download/v$pkgver/${_archive_name}.tar.gz")
sha256sums=("654e8512cadc7ab87f1524e3175340c503b4af15622a7cc133f42e6ae9d68d9d")


package() {
    cd "${_archive_name}"
    install -Dm755 asfa -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    find man/man1 -type f -print0 \
        | xargs -0 install -Dm644 -t "$pkgdir/usr/share/man/man1"
}
