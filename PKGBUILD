# Maintainer: Johannes Schmitz <jonny at wolpzone dot de>

pkgname=bytecopy-git
pkgdesc='Copy byte segments of arbitrary size between files and devices'
url='https://github.com/jonny112/bytecopy'
license=('GPL-3.0-or-later')

pkgver=20250301
pkgrel=1
arch=('x86_64')
options=('!debug')

depends=(
    glibc
)

makedepends=(
    coreutils
    make
    gcc
    git
)

source=('git+https://github.com/jonny112/bytecopy')
sha256sums=('SKIP')

build() {
    cd bytecopy
    make
}

package() {
    install -D -m755 bytecopy/bin/bytecopy -t "${pkgdir}/usr/bin"
    install -D -m644 bytecopy/doc/man1/bytecopy.1 -t "${pkgdir}/usr/share/man/man1"
}
