# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Co-Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adskidentitymanager
pkgver=1.14.0.5
pkgrel=1
pkgdesc='Autodesk Identity Manager'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('webkit2gtk>=2')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adskidentitymanager${pkgver}-1.x86_64.rpm")
b2sums=('a637b4493dd8c005efbf30fce2829fdcf16ccdcc74fc4926eba78da44eab6393ac33a2f4b63fc1415ed03365bd5782e72cf143feff619873141078766872fcbc')

options=(!strip)

prepare() {
    cd "$srcdir/opt/Autodesk/AdskIdentityManager/"
    ln -s "${pkgver}" "Current"
}

package() {
	mv opt "$pkgdir/"
}
