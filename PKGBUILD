# Contributor: Daniel Meszaros <easimer@gmail.com>
# Contributor: Bastien Dejean <nihilhill@gmail.com>
# Contributor: solsTice d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Prurigro

pkgname=xar
pkgver=1.6.1
pkgrel=2
pkgdesc='eXtensible ARchive format'
arch=('i686' 'x86_64')
url='http://mackyle.github.io/xar/'
license=('custom:BSD')
depends=('libxml2' 'openssl' 'bzip2')
options=('!libtool')
source=("http://github.com/mackyle/xar/archive/xar-${pkgver}.tar.gz")
md5sums=('2fa5e3d2c1c2beaf58ef684552d2dbff')

build() {
    cd "$srcdir/${pkgname}-${pkgname}-${pkgver}/${pkgname}"
    ./autogen.sh --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgname}-${pkgver}/${pkgname}"
    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
