# Original Author: Grigorii Horos <horosgrisa@gmail.com>
# Maintainer: Will Price <will.price94@gmail.com>

pkgname=powershell-bin
pkgver=6.0.0.alpha.9
pkgrel=2
pkgdesc="PowerShell"
arch=('any')
url="https://github.com/PowerShell/PowerShell"
license=('MIT')
depends=('libunwind' 'icu')
makedepends=('')
options=('!strip')
source=("${pkgname}-${pkgver}.rpm::https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.9/powershell-6.0.0_alpha.9-1.el7.centos.x86_64.rpm")
md5sums=('daabe5b2dabf11d849a95b0d703075f9')
conflicts=('powershell' 'powershell-git')
provides=('powershell')

package() {
    echo "WARNING: DOES NOT CURRENTLY WORK"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/powershell"

    cp -r usr/local/share \
          "${pkgdir}/usr"
    cp -r opt/microsoft/powershell/6.0.0-alpha.9/* \
          "${pkgdir}/usr/share/powershell"

    ln -fs /usr/share/powershell/powershell \
          "${pkgdir}/usr/bin/powershell"
}
