# Maintainer: Johannes Arnold <johannesarnold@stud.uni-hannover.de>
pkgname=mkmcxx
pkgver=2.15.3
pkgrel=1
epoch=
pkgdesc="Closed-source, freeware microkinetics modeling software written in C++."
arch=('x86_64')
url="https://www.mkmcxx.nl/"
license=('custom')
groups=()
depends=('cairo')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://www.mkmcxx.nl/downloads/stable/mkmcxx-${pkgver}-debian-x64.tar.bz2")
noextract=()
sha256sums=("aae8a09f00c301b28bc08daf3b8e92f05f31b783da5704105aebda3b6d5e8b9c")
validpgpkeys=()

package() {
    cd "$srcdir/mkmcxx"

    # License
    install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    # Main binary
    install -Dm755 bin/mkmcxx "$pkgdir/usr/bin/mkmcxx"

    # Example files
    find examples/ -type f -exec install -Dm644 {} "$pkgdir/usr/share/mkmcxx/{}" \;
}
