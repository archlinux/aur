# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine
pkgver=3.7.5
pkgrel=1
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=https://openrefine.org/
license=('BSD')
depends=('java-runtime>=11' 'bash')
options=('!strip')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/$pkgver/openrefine-linux-$pkgver.tar.gz" 'openrefine.sh')
sha512sums=('894b8d30759cdc15925939cbd325b65de4644cf0523909466f5c4f013064d9fceb6d7194fca79127a5cd82b9db32028d06b42f9d29893363c42999e9f1a7b944'
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
