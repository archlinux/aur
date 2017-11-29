# Maintainer: Nils Czernia <nils[at]czserver[dot[de>

pkgname=bludit
pkgver=2.0.2
pkgrel=2
pkgdesc="Bludit is a small an leightweight CMS without any DB"
arch=("any")
url="https://www.bludit.com/"
license=("MIT")
depends=("php")
source=("https://github.com/bludit/bludit/archive/${pkgver}.tar.gz")
sha256sums=("bc74e965914549e258ad2647efb537bf9bde990f1854b2bbe4282a908c713d55")

package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps/${pkgname}
    install -dm0755 var/lib/${pkgname}

    cp -a $srcdir/${pkgname}-${pkgver}/* usr/share/webapps/${pkgname}
    rm -Rf usr/share/webapps/${pkgname}/bl-content
    ln -s ../../../../var/lib/${pkgname} usr/share/webapps/${pkgname}/bl-content 

    chown -R http:http var/lib/${pkgname}
}
