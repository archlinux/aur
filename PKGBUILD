# Maintainer: Nils Czernia <nils[at]czserver[dot[de>

pkgname=grav-admin
pkgver=1.3.8
pkgrel=1
pkgdesc="Grav is a modern open source flat-file CMS with admin plugin"
arch=("any")
url="https://getgrav.org"
license=("MIT")
depends=("php")
source=("https://github.com/getgrav/grav/releases/download/${pkgver}/${pkgname}-v${pkgver}.zip")
sha256sums=("44523bbd302cd0045b5b399db25eddb4731e76d1b5e2a0bcfcb555c18e53c565")


package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps/${pkgname}
    install -dm0755 var/lib/${pkgname}

    cp -a $srcdir/${pkgname}/* usr/share/webapps/${pkgname}

    cd usr/share/webapps/${pkgname}
    rm *.md composer.json composer.lock

    chown http: -R assets backup cache images logs tmp user
}
