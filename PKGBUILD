# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Co-Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adskidentitymanager
pkgver=1.19.1.8
pkgrel=1
pkgdesc='Autodesk Identity Manager'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('webkit2gtk>=2')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adskidentitymanager${pkgver}-1.x86_64.rpm")
b2sums=('48ca1c132e6663219bd6b6c062b9f4edc570b773473445ce7c33adf2e716a9ba358dc70c6c51bcaf1074c69836b339e200d3b34ea7f6689655011bfc85e216a6')

options=(!strip)

prepare() {
    cd "$srcdir/opt/Autodesk/AdskIdentityManager/"
    ln -s "${pkgver}" "Current"
}

package() {
	mv opt "$pkgdir/"
}
