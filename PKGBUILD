# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine
pkgver=3.8.7
pkgrel=1
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=https://openrefine.org/
license=('BSD')
depends=('java-runtime>=11' 'bash')
options=('!strip')
backup=('opt/openrefine/refine.ini')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/$pkgver/openrefine-linux-$pkgver.tar.gz" 'openrefine.sh')
sha512sums=('b788cd4700ed7c89efe60b057d0045ec6ab07ae09bf53731cd68ce4f178f07a01e81b3a25a6e431f71a7a733c5b5d327f2ff352ebc570ff4a2cca7b832608cad'
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
