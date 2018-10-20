# Maintainer: levinit <levinit at outlook>

pkgname=wechat_web_devtools
pkgver=1.02.1809260
pkgrel=1
pkgdesc="wechat web devtools 微信web开发工具"
arch=('any')
url="https://github.com/cytle/wechat_web_devtools"
license=('custom')

depends=('wine' 'wine-mono' 'wget' 'wine_gecko')
#makedepends=('wine_gecko')

source=("https://github.com/cytle/wechat_web_devtools/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

install=${pkgname}.install

package() {
    #rm -rf $srcdir/$pkgname-$pkgver/images

    install -dm755 $pkgdir/opt
    cp -r $srcdir/$pkgname-$pkgver $pkgdir/opt/$pkgname

    #修改软件标题名为英文避免乱码
    sed -i s/微信web开发者工具/wechat_web_devtools/ $pkgdir/opt/$pkgname/desktop.example
    sed -i '/Name/a StartupWMClass=wechat_web_devtools' $pkgdir/opt/$pkgname/desktop.example
    sed -i s/微信开发者工具/wechat_web_devtools/ $pkgdir/opt/$pkgname/package.nw/package.json
    sed -i s/微信web开发者工具/wechat_web_devtools/ $pkgdir/opt/$pkgname/package.nw/package.json
}
