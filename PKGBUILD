# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine-beta
_pkgname=openrefine
pkgver=3.2b
_pkgver=3.2-beta
pkgrel=1
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=http://openrefine.org
license=('BSD')
depends=('java-environment' 'bash')
conflicts=('openrefine')
provides=('openrefine')
options=('!strip')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/${_pkgver}/${_pkgname}-linux-${_pkgver}.tar.gz" "openrefine.sh")
sha512sums=('5137af5bf15508e8d9bea7c2589b9556fb23e98dcf05c665e9d004c4f14b6bea473c0557a41ef28279943d2fd5124d709e70b6adfabfa58075f9f2bb0c275e0c'
            '2e3a551c15d99698a3a81051d44514b4e7f1b7c362076d1a9e8b8b3f5902c73f29a2eab367995b078336451037b021a6849219889f97c16524e261cbac180ec1')

package()
{
    install -d ${pkgdir}/opt/${_pkgname}
    cp -a ${srcdir}/${_pkgname}-${_pkgver}/* ${pkgdir}/opt/${_pkgname}
    # License
    install -d ${pkgdir}/usr/share/licenses/${pkgname}/
    install ${srcdir}/${_pkgname}-${_pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/
    # refine is already used by argyllcms
    install -d ${pkgdir}/usr/bin
    install openrefine.sh ${pkgdir}/usr/bin/openrefine
}
