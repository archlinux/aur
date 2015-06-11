# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=openarkkit
pkgver=196
pkgrel=2
pkgdesc="The openark kit provides common utilities to administer, diagnose and audit MySQL databases."
arch=('any')
url="https://code.google.com/p/openarkkit"
license=('custom')
depends=('python2')

source=(https://openarkkit.googlecode.com/files/openark-kit-${pkgver}.tar.gz)
sha256sums=('d740a413febd8b62e1785c928f0bc584cd02ce630b51fe9005248fd401f2f6d8')

build() {
    cd "${srcdir}/openark-kit-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/openark-kit-${pkgver}"
    python2 setup.py install --home="${pkgdir}/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
