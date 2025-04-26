# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Co-Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adskidentitymanager
pkgver=1.15.3.5
pkgrel=1
pkgdesc='Autodesk Identity Manager'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('webkit2gtk>=2')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adskidentitymanager${pkgver}-1.x86_64.rpm")
b2sums=('79e40cd7d347fac8d25523eca5de84f73c13c1339071520d88fa63e1268009f78154942bbe0c8ef5d5e69286381db6dc2e2ce06349683cca1a6b70496fc1668b')

options=(!strip)

prepare() {
    cd "$srcdir/opt/Autodesk/AdskIdentityManager/"
    ln -s "${pkgver}" "Current"
}

package() {
	mv opt "$pkgdir/"
}
