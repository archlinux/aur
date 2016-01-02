# Maintainer: Michael Gerber <aur at lynxcore dot org >
pkgname=open-xchange
pkgver=7.8.0
pkgrel=6
pkgdesc='The Open-Xchange backend'
groups=('open-xchange-minimal')
install='open-xchange.install'
arch=('any')
url='http://www.ox.io/'
license=('GPLv2')
depends=('open-xchange-authentication' 'open-xchange-authorization' 'open-xchange-mailstore' 'open-xchange-smtp')
makedepends=()
conflicts=()
provides=('open-xchange')
source=('https://software.open-xchange.com/products/appsuite/stable/backend/DebianJessie/all/open-xchange_7.8.0-6_all.deb')
sha256sums=('7ce5a3cc8f312177ea2471b82c1b83defeb3f83a14ac070eed1adbeef7c52e8b')

package() {
    if test -f "data.tar.xz"; then
        tar xf data.tar.xz
        cp -a usr "$pkgdir"
        mkdir -p "$pkgdir"/usr/lib/systemd/system
        install -m 755 lib/systemd/system/open-xchange.service "$pkgdir"/usr/lib/systemd/system/
    fi
    
    if test -f "data.tar.gz"; then
        tar xf data.tar.gz
        cp -a usr "$pkgdir"
        install -m 755 lib/systemd/system/open-xchange.service /usr/lib/systemd/system/
    fi
}
