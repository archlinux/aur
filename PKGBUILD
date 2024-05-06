# Maintainer: Marco A Rojas <marquicus at gmail dot com>

pkgname=shlorem
pkgver=1.1.2.r1.g4a37420
pkgrel=2
pkgdesc="Lorem Ipsum generator for the command line (pure bash)"
arch=(any)
url="https://github.com/pforret/shlorem"
license=('MIT')
makedepends=('git')
depends=('aspell-en')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 shlorem.sh "$pkgdir/usr/bin/shlorem"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
