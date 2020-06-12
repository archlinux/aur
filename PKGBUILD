# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>

pkgname=bludit
pkgver=3.12.0
pkgrel=1
pkgdesc="Bludit is a small an leightweight CMS without any DB"
arch=("any")
url="https://www.bludit.com/"
license=("MIT")
depends=("php")
source=("https://github.com/bludit/bludit/archive/${pkgver}.tar.gz")
sha256sums=('6645216ad24b4f7b448af8b03bf6a53744f74c453d317e1a8c5ceb42e06856fe')

package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps/${pkgname}
    install -dm0755 var/lib/${pkgname}

    cp -a $srcdir/${pkgname}-${pkgver}/* usr/share/webapps/${pkgname}
    rm -Rf usr/share/webapps/${pkgname}/bl-content
    ln -s ../../../../var/lib/${pkgname} usr/share/webapps/${pkgname}/bl-content 

    chown -R http:http var/lib/${pkgname}
}
