# Maintainer: Jorengarenar

pkgname=css-beautify
pkgver=1.10.1
pkgrel=1
pkgdesc='Beautifier for CSS'
arch=('any')
depends=('python-jsbeautifier')
url='https://github.com/beautify-web/js-beautify/#css--html'
license=('MIT')
source=("${pkgname}::git+https://github.com/Jorengarenar/css-beautify.git")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$pkgname/src"
    mkdir -p "${pkgdir}/usr/share"
    cp -r cssbeautifier "${pkgdir}/usr/share"
    install -Dm755 $pkgname "${pkgdir}/usr/share"
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "${pkgdir}/usr/share/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
