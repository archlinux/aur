# Maintainer: <me at adambac dot com>

pkgname='webhttrack'
pkgver='3.48.22'
pkgrel=1
pkgdesc='HTTrack is a free (GPL, libre/free software) and easy-to-use offline browser utility.'
license=(GPL)
url='http://www.httrack.com/'
arch=('any')
provides=('httrack')
conflicts=('httrack' 'webhttrack-git')
depends=('bash' 'zlib' 'hicolor-icon-theme' 'openssl')
source=("http://download.httrack.com/cserv.php3?File=httrack.tar.gz")
md5sums=('843ccd49bfef2309b195479cac07d618')

build() {
    cd "httrack-${pkgver}"
    ./configure --prefix=/usr
    make -j8
}

package() {
    cd "httrack-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
