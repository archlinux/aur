# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=zeebe-modeler
pkgver=0.9.0
pkgrel=1
pkgdesc="Desktop Application for modeling Zeebe Workflows with BPMN"
arch=('x86_64')
url="https://github.com/zeebe-io/zeebe-modeler"
license=('MIT')
depends=('nodejs' 'xdg-utils')
makedepends=('tar')
install=$pkgname.install
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/zeebe-io/zeebe-modeler/releases/download/v$pkgver/zeebe-modeler-$pkgver-linux-x64.tar.gz"
    "$pkgname.install")

package() {
    install -d $pkgdir/opt/$pkgname
    cp -R $srcdir/$pkgname-$pkgver-linux-x64/* $pkgdir/opt/$pkgname
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/$pkgname/zeebe-modeler $pkgdir/usr/bin/zeebe-modeler
}
md5sums=('fb625e0acbdac733344934ed88a4b3de'
         '615f2fe722cc5b3eea9c9ea9d22bdafd')
