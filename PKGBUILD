# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

# Based on the code from:
# Lenovsky    <lenovsky@pm.me>

pkgname=lenopow
pkgver=1.0.6
pkgrel=1
pkgdesc="A script to enable/disable battery conservation mode in Lenovo Ideapad/LEGION notebooks."
arch=('any')
url="https://github.com/schinfo/${pkgname}"
license=('custom:unlicense')
source=("https://github.com/schinfo/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('62fd78dd8a6251bb640fd881275a296b9daf7621a87c5fd83d739b0c97614b6e')

package()  {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
