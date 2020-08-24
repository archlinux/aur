# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine-beta
_pkgname=openrefine
pkgver=3.4b2
_pkgver=3.4-beta2
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
sha512sums=('a9b60c9f6492971daf70e01f50823ba8547c05571c0903fc8bf645bf7d5cd69ffcd228508a93b9ab3b3dc3402e18030c8e93b83774d2e329d9b4b68877f8db11'
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
