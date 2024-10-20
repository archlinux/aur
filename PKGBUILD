# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

# Based on the code from:
# Lenovsky    <lenovsky@pm.me>

pkgname=lenopow
pkgver=1.0.5
pkgrel=1
pkgdesc="A script to enable/disable battery conservation mode in Lenovo Ideapad/LEGION notebooks."
arch=('any')
url="https://github.com/schinfo/${pkgname}"
license=('custom:unlicense')
source=("https://github.com/schinfo/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6ed967c90bc8e700c38fc535b70567029b43a3a4da4f1362a5858ae33b4f91e8')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
