# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine
pkgver=3.1
pkgrel=1
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=http://openrefine.org
license=('BSD')
depends=('java-environment' 'bash')
options=('!strip')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/${pkgver}/${pkgname}-linux-${pkgver}.tar.gz" 'openrefine.sh')
sha512sums=('7a40ab62f0e746647ea2c485d9ed25a1f57c2e119b621371c5577b48d3c55ded42882de771a4f73392fa38fc4a128f48f0175363c4f5660ea82d9f551481c556'
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
