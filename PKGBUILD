# Maintainer: Elias Haddad <eliasynetto at gmail dot com>
pkgname=gbutils
pkgver=6.4
pkgrel=4
pkgdesc="Giulio Bottazzi's Command Line Econometrics"
arch=(x86_64)
url="http://cafim.sssup.it/~giulio/software/gbutils/"
license=(GPL2)
provides=(gbutils)
conflicts=(gbutils)
source=("http://cafim.sssup.it/~giulio/software/gbutils/gbutils-6.4.tar.gz")
noextract=('$pkgname-$pkgver.tar.gz')
md5sums=('SKIP')
depends=('gsl>=2.1' 'libmatheval>=1.0.1' 'zlib')

prepare(){

    # extracts the original package
    tar xvzf $pkgname-$pkgver.tar.gz

    # enter correct directory 
    cd ${pkgname}-${pkgver}

}


build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

check() {
    cd ${pkgname}-${pkgver}
    make check
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}




