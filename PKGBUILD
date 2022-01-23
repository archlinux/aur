# Maintainer: Sabu Siyad <hello@ssiyad.com>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=victor
pkgver=0.4
pkgrel=2
pkgdesc="Command line tool to log activities and measure time spent"
arch=('x86_64')
url="https://github.com/ssiyad/victor"
makedepends=(
    "git"
    "nimble"
)
provides=("victor")
source=(
    "git+https://github.com/ssiyad/victor#tag=$pkgver"
)
sha256sums=("SKIP")

build() {
    cd $srcdir/$pkgname
    nimble build -d:release
}

package() {
    cd $srcdir/$pkgname
    install -D $pkgname $pkgdir/usr/local/bin/$pkgname
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
