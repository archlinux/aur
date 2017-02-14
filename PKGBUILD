# Maintainer: <me at adambac dot com>

pkgname='webhttrack'
pkgver='3.48.21'
pkgrel=1
pkgdesc='HTTrack is a free (GPL, libre/free software) and easy-to-use offline browser utility.'
license=(GPL)
url='http://www.httrack.com/'
arch=('any')
provides=('httrack')
conflicts=('httrack' 'webhttrack-git')
depends=('bash' 'zlib' 'hicolor-icon-theme' 'openssl')
source=("https://github.com/xroche/httrack/archive/${pkgver}.tar.gz")
md5sums=('3f2e60f637697bf326856817fb8a015d')

build() {
    cd "httrack-${pkgver}"
    ./configure --prefix=/usr
    make -j8
}

package() {
    cd "httrack-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
