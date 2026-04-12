# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Co-Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adskidentitymanager
pkgver=1.18.2.1
pkgrel=1
pkgdesc='Autodesk Identity Manager'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('webkit2gtk>=2')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adskidentitymanager${pkgver}-1.x86_64.rpm")
b2sums=('185207b72330e10bd58272cd21283e29a789c6d7436d9ff5ad4850cec9cf2bf7fd721214c5117dbc6e172c5d4c30d99f60ea55aeea229643e07225c64c316139')

options=(!strip)

prepare() {
    cd "$srcdir/opt/Autodesk/AdskIdentityManager/"
    ln -s "${pkgver}" "Current"
}

package() {
	mv opt "$pkgdir/"
}
