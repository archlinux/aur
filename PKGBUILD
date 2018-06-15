# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine-beta
_pkgname=openrefine
pkgver=3.0b
_pkgver=3.0-beta
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
sha512sums=('f8efb4ea37bb062d74d118342be15b8ff82595b07a60527d108dc1fcad3c79f62be5e8e19a2f7313a3e8bba34f39f7b6cbc4dfccc57a2ae5aff17f451877d8a9'
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
