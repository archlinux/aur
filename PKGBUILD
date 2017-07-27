pkgname=bellepoulebeta
pkgver=5.0
pkgrel=25
pkgdesc="Fencing tournament management software"
arch=('i686' 'x86_64')
url="http://betton.escrime.free.fr/fencing-tournament-software/en/bellepoule/index.html"
license=('GPL3')
depends=('gtk2>=2.24.0' 'xml2' 'curl' 'libmicrohttpd' 'goocanvas1' 'qrencode' 'openssl' 'lighttpd' 'php-cgi' 'json-glib')
source=("https://launchpad.net/~betonniere/+archive/ubuntu/bellepoule/+files/${pkgname}_${pkgver}ubuntu${pkgrel}~xenial1.tar.gz")
sha256sums=('2ba84febe417dea75f8d7de060cda217a7a10722a250e88f34a97d573b954231')

build() {
    cd "${pkgname}_${pkgver}"
    make
}

package() {
    cd "${pkgname}_${pkgver}"
    make DESTDIR="$pkgdir/" install
}
