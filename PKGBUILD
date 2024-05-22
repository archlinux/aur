# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine
pkgver=3.8.1
pkgrel=1
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=https://openrefine.org/
license=('BSD')
depends=('java-runtime>=11' 'bash')
options=('!strip')
backup=('opt/openrefine/refine.ini')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/$pkgver/openrefine-linux-$pkgver.tar.gz" 'openrefine.sh')
sha512sums=('0c67bffc6875403e50330e3abc26d2e9283621462f0b3ebda1b0d954ae399cdb322d0e61067e19dc2f047c0462666fdc80c014fa2b0fa602ed0f9660612a06bd'
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
