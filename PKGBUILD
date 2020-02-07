# Maintainer: andys8 <andys8@users.noreply.github.com>
pkgname=git-brunch
pkgver=1.1.2
pkgrel=1
pkgdesc="A git checkout and rebase command-line tool"
arch=('x86_64')
url="https://github.com/andys8/git-brunch"
license=('custom:BSD3')
makedepends=('git' 'stack')
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
