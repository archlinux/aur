# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>

pkgname=openrefine-beta
_pkgname=openrefine
pkgver=2.6rc2
_pkgver=2.6-rc.2
pkgrel=1
pkgdesc="A free, open source power tool for working with messy data and improving it"
arch=('any')
url=http://openrefine.org
license=('BSD')
depends=('java-environment' 'bash')
options=('!strip')
source=("https://github.com/OpenRefine/OpenRefine/releases/download/${_pkgver}/${_pkgname}-linux-${_pkgver}.tar.gz")
sha512sums=('4f689202eb39a66ab7881f7eba17aa568aa9b07e4227b35f82eee4e37a757299b7572d826b6501a66ea9aa180f33a7800bd79ff1d2b1a806a9e54ba0e3e2cb56')

package()
{
    install -d ${pkgdir}/opt/${_pkgname}
    cp -a ${srcdir}/${_pkgname}-${_pkgver}/* ${pkgdir}/opt/${_pkgname}
    # License
    install -d ${pkgdir}/usr/share/licenses/${pkgname}/
    install ${srcdir}/${_pkgname}-${_pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}

