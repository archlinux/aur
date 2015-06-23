# Maintainer : Dev Brush Technology <feedback@devbrush.com>

pkgname=ignis
pkgver=1.0.3.1
pkgrel=1
pkgdesc='A Console Based Static Website Building Program'
arch=('any')
url='http://devbrush.com/project/ignis'
license=('BSD')
depends=('python>=3.0')
source=("http://devbrush.com/files/${pkgname}${pkgver}.tar.gz")
sha512sums=('6a13fcd382d20126b61b1723183798d19ceaab31e7eda28f70b8a3b45cc86dc19b27ec385c8845d4c4bda537fb5ee73e7ff8a3111a1d25dda051a90455dce08f')

package() {
    cd ${srcdir}/${pkgname}${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
    mkdir -p ${pkgdir}/etc/ignis/
    cp -r "${srcdir}/${pkgname}${pkgver}/docs/example/" "${pkgdir}/etc/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}${pkgver}/docs/ignis.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 "${srcdir}/${pkgname}${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

