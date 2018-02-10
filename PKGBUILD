# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine
pkgver=2.8
pkgrel=2
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=http://openrefine.org
license=('BSD')
depends=('java-environment' 'bash')
options=('!strip')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/${pkgver}/${pkgname}-linux-${pkgver}.tar.gz" 'openrefine.sh')
sha512sums=('03f41aa0e83a5c7c8d080c38f0f621a654eb0057168e2f615cab42f63c5a75c57b444cb24bf3185ad20eb0359b877f9e9ce48d101057865eb2d5226de5b4b218'
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
