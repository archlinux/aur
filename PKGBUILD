# Maintainer: <cit at protonmail dot com>

pkgname='webhttrack'
pkgver='3.49.2'
pkgrel=1
pkgdesc='HTTrack is a free (GPL, libre/free software) and easy-to-use offline browser utility.'
license=(GPL)
url='http://www.httrack.com/'
arch=('any')
provides=('httrack')
conflicts=('httrack' 'webhttrack-git')
depends=('bash' 'zlib' 'hicolor-icon-theme' 'openssl')
source=("http://download.httrack.com/cserv.php3?File=httrack.tar.gz")
md5sums=('1fd1ab9953432f0474a66b67a71d6381')

build() {
    cd "httrack-${pkgver}"
    ./configure --prefix=/usr
    make -j8
}

package() {
    cd "httrack-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
