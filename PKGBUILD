# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>

_pkgname=resty
pkgname=${_pkgname}-git
pkgver=r203.82d9cbd
pkgrel=1
pkgdesc="Little command line REST client that you can use in pipelines."
arch=('any')
url="https://github.com/micha/resty"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/micha/resty')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "resty" "${pkgdir}/usr/bin/resty"
    install -Dm644 "MIT-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
