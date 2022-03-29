# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
_pkgname=cmcrameri
pkgname=python-${_pkgname}
pkgver=1.4
pkgrel=1
pkgdesc="A wrapper around Fabio Crameri's perceptually uniform colourmaps for geosciences."
arch=('any')
url="https://github.com/callumrollo/${_pkgname}/"
license=('MIT')
depends=('python-numpy' 'python-matplotlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/callumrollo/${_pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('382fe2e4217c16b8f92395fdc901fe7470d453b263c34f00786babeda97d68c3e9f25e5484f9a7d83dfe4fdf656b59b0b398825a20ed08525b1830e257660f6c')

package() {

    cd "${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1

    rm "${pkgdir}/usr/LICENSE"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
