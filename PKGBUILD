# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=payara
pkgver=4.1.2.173
pkgrel=1
pkgdesc="A Java EE application server, drived from GlassFish Open Source Edition."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("java-environment>=7")
arch=("any")
options=(!strip)
source=("$pkgname-$pkgver.zip::https://search.maven.org/remotecontent?filepath=fish/$pkgname/distributions/$pkgname/$pkgver/$pkgname-$pkgver.zip"
        "payara.service")

sha256sums=('944fae8fa38e83cf291e6176152827113a4733174096c49a2cf3d218ba1ad7f2'
            'ab5c47bdba5daf459b6422e4eeaa9a609a8d0e25a942f7c6a9e891098e9b6232')

package() {
    mkdir -p $pkgdir/opt
    mv payara41 $pkgdir/opt/
    install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
