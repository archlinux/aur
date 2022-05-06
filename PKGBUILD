pkgname=mathematica-documentation-zh-cn
pkgver=13.0.1
pkgrel=1
pkgdesc="Mathematica Documentation (zh-cn)"
url="http://www.wolfram.com/mathematica/"
license=("proprietary")
arch=('any')
depends=('mathematica')
makedepends=('cpio')
source=('local://WLDocs_13.0.1_Chinese_MAC_CN.pkg')
md5sums=('812b29049a0ffe9f6df039cd3d9469ee')
install=install.install

prepare() {
    cd $srcdir/zh-Hans-cn.pkg
    mv Payload Payload.gz
    gzip -d Payload.gz
    cpio -i < Payload
}

package() {
    mkdir -p $pkgdir/opt/Mathematica/Documentation/
    cd $srcdir/zh-Hans-cn.pkg/Wolfram/Documentation/13.0/zh-hans-cn/Documentation
    mv ./ChineseSimplified $pkgdir/opt/Mathematica/Documentation/
}
