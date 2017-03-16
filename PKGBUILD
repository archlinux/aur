# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine-beta
_pkgname=openrefine
pkgver=2.7rc2
_pkgver=2.7-rc.2
pkgrel=1
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=http://openrefine.org
license=('BSD')
depends=('java-environment' 'bash')
options=('!strip')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/${_pkgver}/${_pkgname}-linux-${_pkgver}.tar.gz")
sha512sums=('322f69bfc90a2321c1e1afff6444fd8c249c462aa7ea7dfeba7c61c71f21dfa3bce19dca09048be2f642fb94dc1a9f5cf5a6a526822408bd66c5bc4ca1bcd055')

package()
{
    install -d ${pkgdir}/opt/${_pkgname}
    cp -a ${srcdir}/${_pkgname}-${_pkgver}/* ${pkgdir}/opt/${_pkgname}
    # License
    install -d ${pkgdir}/usr/share/licenses/${pkgname}/
    install ${srcdir}/${_pkgname}-${_pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}

