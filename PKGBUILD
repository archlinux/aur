# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange
pkgver=7.8.0
pkgrel=6
pkgdesc='Systemd service file for OX'
groups=('open-xchange-minimal' 'open-xchange' 'open-xchange-all')
install='open-xchange.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-authentication' 'open-xchange-authorization' 'open-xchange-mailstore' 'open-xchange-smtp' 'open-xchange-grizzly')
optdepends=('open-xchange-httpservice: Replacement for open-xchange-grizzly')
provides=('open-xchange')
source=('https://software.open-xchange.com/products/appsuite/stable/debs/DebianJessie/all/open-xchange_7.8.0-6_all.deb')
sha256sums=('7ce5a3cc8f312177ea2471b82c1b83defeb3f83a14ac070eed1adbeef7c52e8b')

package() {
    if test -f "data.tar.xz"; then
        tar xf data.tar.xz
        cp -a $(find . -mindepth 1 -maxdepth 1 -type d) "$pkgdir"
    fi
    
    if test -f "data.tar.gz"; then
        tar xf data.tar.gz
        cp -a $(find . -mindepth 1 -maxdepth 1 -type d) "$pkgdir"
    fi
}
