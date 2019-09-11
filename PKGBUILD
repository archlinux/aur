# Maintainer: Jorengarenar

pkgname=css-beautify-git
_pkgname=css-beautify
pkgver=1.10.1
pkgrel=2
pkgdesc='Beautifier for CSS'
arch=('any')
depends=('python-jsbeautifier')
url='https://github.com/beautify-web/js-beautify/#css--html'
license=('MIT')
source=("${_pkgname}::git+https://github.com/Jorengarenar/css-beautify.git")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$_pkgname/src"
    mkdir -p "${pkgdir}/usr/share/${_pkgname}"
    cp -r cssbeautifier "${pkgdir}/usr/share/${_pkgname}"
    install -Dm755 $_pkgname "${pkgdir}/usr/share/${_pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    cd "$srcdir/$_pkgname"
    install -Dm755 $_pkgname "${pkgdir}/usr/bin"
}
