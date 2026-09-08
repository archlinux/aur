# Maintainer: Elchi <github@elchi.dev>
#
# The released binary rather than a build from source. It is the same file
# the project tests on Linux in CI, and building it here would compile a
# database on a machine that has already been given one.
#
# The source-building package is `quantydb`. This is `quantydb-bin`.
#
# Version and checksum are written by the release workflow. Editing them
# by hand means editing them wrong.
pkgname=quantydb-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="One database that reshapes itself into whatever you need"
arch=('x86_64')
url="https://github.com/QuantyRoot/QuantyDatabase"
license=('MIT')
provides=('quantydb')
conflicts=('quantydb')
# Nothing. Not a convention here, a measurement: the lock file holds this
# workspace and no other package.
depends=()
source=("quantydb-$pkgver::$url/releases/download/v$pkgver/quantydb-linux-x86_64"
        "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
sha256sums=('e1ba7d283b8add76d1eb38bff47b1c3a48cbd42c3566884842496ddf8ed0c282'
            'SKIP')

package() {
    install -Dm755 "$srcdir/quantydb-$pkgver" "$pkgdir/usr/bin/quantydb"
    install -Dm644 "$srcdir/LICENSE-$pkgver" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
