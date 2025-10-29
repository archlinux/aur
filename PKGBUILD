# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Co-Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adskidentitymanager
pkgver=1.16.3.1
pkgrel=1
pkgdesc='Autodesk Identity Manager'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('webkit2gtk>=2')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adskidentitymanager${pkgver}-1.x86_64.rpm")
b2sums=('9caa05a84fab5cf0faa9e0fa6762182285c5abec4d47e4f802cfe40f1f3cb7a766144453ef1401773b042edb69c4dbfd821c54f4a7c84b344dad1e5f7bba8c55')

options=(!strip)

prepare() {
    cd "$srcdir/opt/Autodesk/AdskIdentityManager/"
    ln -s "${pkgver}" "Current"
}

package() {
	mv opt "$pkgdir/"
}
