# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=radia
pkgver=4.31
pkgrel=2
pkgdesc="Mathematica addon for magnetostatics calculations"
arch=('x86_64')
url="http://www.esrf.eu/Accelerators/Groups/InsertionDevices/Software/Radia"
license=('custom')
depends=('mathematica')
source=("http://ftp.esrf.fr/pub/InsertionDevices/RADIA/V$pkgver/Linux/Mathematica10/Radia_${pkgver//./_}_linux2.6_x64_mma10.tgz")
sha512sums=("a459730a63a067f42d0df8a7472caa00979f15c307c49d17cb658838e02fa0cebe47b1bc80f3e438dc021917b4c2ddc8c251867655365346ed3dc0890c7fa567")

package() {
    installdir="${pkgdir}/opt/Mathematica/AddOns/Applications/"
    mkdir -p "${installdir}"
    cp -R -d --preserve=timestamps "${srcdir}/Radia" "${installdir}"
    chmod -R 755 "${installdir}"
    install -Dm644 "${srcdir}/Radia/CopyRight.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
