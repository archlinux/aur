# $Id$
# Maintainer: Doctorzeus <simmlog@gmail.com>

pkgname=gashell
_pkgname=GAShell
pkgver=1.0
pkgrel=1
pkgdesc="A bash script that generates and securely manages/stores Google Authenticator codes."
arch=('x86_64' 'i686')
url="https://github.com/DDoctorzeus/GAShell"
license=('GNU V3')
depends=('sed' 'oath-toolkit' 'openssl' 'zbar' 'curl')
provides=('gashell')
source=(https://github.com/DDoctorzeus/$_pkgname/archive/$pkgver.tar.gz)
sha256sums=('1b1c389ffe7db6c82303f854f5127643de4aad818af3e84b0cb050b5c1498ae8')

package() {
    mkdir -p "$pkgdir/usr/share/$pkgname/";
    mkdir -p "$pkgdir/usr/bin/";
    
    chmod 755 "$srcdir/$_pkgname-$pkgver/$pkgname.sh"; 
    cp -R "$srcdir/$_pkgname-$pkgver/$pkgname.sh" "$pkgdir/usr/share/$pkgname/";
    ln -s "/usr/share/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname";
}
