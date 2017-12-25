# Maintainer: Marc van der Sluys  < han [at] vandersluys [dt] nl >
pkgname=han-ese-ops_rpi
pkgver=0.1
pkgrel=3
pkgdesc="Scripts for the Raspberry Pi for the Final Assignment of HAN ESE OPS."
arch=('any')
url="https://github.com/han-ese/Arch-RPi"
license=('GPL3')
depends=('bash' 'python3' 'python-sense-hat' 'python-netifaces')
changelog=ChangeLog
source=("https://github.com/han-ese/Arch-RPi/archive/v${pkgver}.tar.gz")
sha512sums=('1f230d720d37dea4ff1663879b7776be197f4b86742f20fc578b19408fe91b5230d34a6c8ca88f72cde57a069d39039bc94c1121afee5c590c6e26c41ea2cab4')

package() {
    cd Arch-RPi-${pkgver}
    mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/usr/lib/systemd/system/
    cp -vp python/*   ${pkgdir}/usr/bin/
    cp -vp shell/*    ${pkgdir}/usr/bin/
    cp -vp systemd/*  ${pkgdir}/usr/lib/systemd/system/
    chmod a+x ${pkgdir}/usr/bin/*
}
