# Contributor: Bastien Dejean <nihilhill@gmail.com>
# Contributor: solsTice d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Prurigro

pkgname=xar
pkgver=1.5.2
pkgrel=5
pkgdesc='eXtensible ARchive format'
arch=('i686' 'x86_64')
url='http://code.google.com/p/xar/'
license=('custom:BSD')
depends=('libxml2' 'openssl' 'bzip2')
provides=("$pkgname")
conflicts=("$pkgname")
options=('!libtool')
source=("http://xar.googlecode.com/files/xar-${pkgver}.tar.gz")
md5sums=('8eabb055d3387b8edc30ecfb08d2e80d')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
