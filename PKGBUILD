# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine
pkgver=3.5.0
pkgrel=1
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=https://openrefine.org/
license=('BSD')
depends=('java-runtime>=8' 'bash')
options=('!strip')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/${pkgver}/${pkgname}-linux-${pkgver}.tar.gz" 'openrefine.sh')
sha512sums=('f9e6a82f73bfe739ed586ab5560739ab27a9f451f1047e7bd1f9e6b91a7bad9a0150ceaadeff11dad4eb82b51379fbcb048bfa56afe3e0d1b3d8ebfa3f26484e'
            '2e3a551c15d99698a3a81051d44514b4e7f1b7c362076d1a9e8b8b3f5902c73f29a2eab367995b078336451037b021a6849219889f97c16524e261cbac180ec1')

package()
{
    install -d ${pkgdir}/opt/${pkgname}
    cp -a ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
    # License
    install -d ${pkgdir}/usr/share/licenses/${pkgname}/
    install ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/
    # refine is already used by argyllcms
    install -d ${pkgdir}/usr/bin
    install openrefine.sh ${pkgdir}/usr/bin/openrefine
}
