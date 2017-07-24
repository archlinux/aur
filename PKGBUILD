# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=payara
pkgver=4.1.2.172
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

sha256sums=('5ca8e79822cf9a9e7adca84a21ab79acb91b5b86489bcd5c9b34f62ec86dcd4a'
            'ab5c47bdba5daf459b6422e4eeaa9a609a8d0e25a942f7c6a9e891098e9b6232')

package() {
    mkdir -p $pkgdir/opt
    mv payara41 $pkgdir/opt/
    install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
