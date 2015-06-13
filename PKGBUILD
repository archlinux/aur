# Maintainer: Marco Pompili <marcs.pompili@gmail.com>

pkgname=proxydriver
pkgver=1.61
pkgrel=2
pkgdesc="Sets GNOME or KDE proxy settings using NetworkManager's informations"
arch=('any')
url="http://marin.jb.free.fr/proxydriver/"
license=('GPL')
depends=('networkmanager')
optdepends=('gconf' 'kdebase-runtime')
source=(http://downloads.sourceforge.net/sourceforge/proxydriver/proxydriver_${pkgver}_all.deb)
md5sums=('0c27ce986156e8842747c07bec85876a')

package() {
    ar -xv proxydriver_${pkgver}_all.deb
    tar -xvf data.tar.gz
    
    mv "$srcdir/usr" "$pkgdir"
    mv "$srcdir/etc" "$pkgdir"
    
    install -m755 "$pkgdir/usr/share/doc/proxydriver/proxydriver.sh" \
     "$pkgdir/etc/NetworkManager/dispatcher.d/99-proxydriver.sh"
}

