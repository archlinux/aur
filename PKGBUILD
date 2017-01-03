# Maintainer: Quey-Liang Kao<s101062801@m101.nthu.edu.tw>

pkgname=hifive1-sdk-git
pkgver=v0.0.5.r785.g6df383c
pkgrel=1
pkgdesc="The Official SDK of the RISC-V-based HiFive Board"
depends=('')
makedepends=('git' 'base-devel')
arch=('x86_64')
source=("git+https://github.com/sifive/freedom-e-sdk.git")
url="https://www.sifive.com/"
license=("APACHE")
sha256sums=('SKIP')

prepare() {
    cd $srcdir/$pkgname
}

build() {
    cd $srcdir/$pkgname
    make tools
}

package() {
    cd $srcdir/$pkgname
}

pkgver() {
    cd $srcdir/$pkgname
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
