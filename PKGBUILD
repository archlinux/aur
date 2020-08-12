# Maintainer: andys8 <andys8@users.noreply.github.com>
pkgname=git-brunch
pkgver=1.4.0
pkgrel=0
pkgdesc="A git checkout and rebase command-line tool"
arch=('x86_64')
url="https://github.com/andys8/git-brunch"
license=('custom:BSD3')
depends=('git')
makedepends=('stack')
source=("${pkgname}-${pkgver}::git://github.com/andys8/${pkgname}.git#tag=v${pkgver}")
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
