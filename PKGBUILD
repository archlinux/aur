# Maintainer chron <chron at posteo dot de>
pkgname=httpdiff-git
pkgver=git
pkgrel=1
pkgdesc="Perform the same request against two HTTP servers and diff the results"
arch=("i686" "x86_64")
url="https://github.com/jgrahamc/httpdiff"
license=("GPL2")
makedepends=("git" "go")
source=("${pkgname}::git+https://github.com/jgrahamc/httpdiff.git")

sha256sums=("SKIP")

build() {
    cd ${srcdir}/${pkgname}
    make all
}

package() {
    cd ${srcdir}/${pkgname}
    install -Dm 755 "${srcdir}/${pkgname}/httpdiff" "${pkgdir}/usr/bin/httpdiff"
    install -Dm 644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
