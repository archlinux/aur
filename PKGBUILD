# Maintainer: Jorengarenar

pkgname=css-beautify
pkgver=1.10.1
pkgrel=2
pkgdesc='Beautifier for CSS'
arch=('any')
depends=('python-jsbeautifier')
url='https://github.com/beautify-web/js-beautify/#css--html'
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$pkgname-${pkgver}/src"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r cssbeautifier "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 $pkgname "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    cd "$srcdir/$pkgname-${pkgver}"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
}
