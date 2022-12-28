# Maintainer: andys8 <andys8@users.noreply.github.com>
pkgname=git-brunch
pkgver=1.6.0
pkgrel=1
pkgdesc="A git command-line tool to work with branches"
arch=('x86_64')
url="https://github.com/andys8/git-brunch"
license=('custom:BSD3')
depends=('git')
makedepends=('stack')
source=("${pkgname}-${pkgver}::https://github.com/andys8/${pkgname}.git#tag=v${pkgver}")
noextract=()
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    stack --local-bin-path "${pkgdir}/usr/bin/" install
}
