# Maintainer: Nils Czernia <nils[at]czserver[dot[de>

pkgname=bludit
pkgver=2.0.2
pkgrel=2
pkgdesc="Bludit is a small an leightweight CMS without any DB"
arch=("any")
url="https://www.bludit.com/"
license=("MIT")
depends=("php")
source=("https://df6m0u2ovo2fu.cloudfront.net/builds/${pkgname}-v${pkgver}.zip")
sha256sums=("8b3dd7b9609d52a931b4a5b3ef85f94a1b7b84a8b9e342a635ca20ea8e91d3b1")

package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps/${pkgname}
    install -dm0755 var/lib/${pkgname}

    cp -a $srcdir/${pkgname}-v${pkgver}/* usr/share/webapps/${pkgname}
    rm -Rf usr/share/webapps/${pkgname}/bl-content
    ln -s ../../../../var/lib/${pkgname} usr/share/webapps/${pkgname}/bl-content 

    chown -R http:http var/lib/${pkgname}
}
