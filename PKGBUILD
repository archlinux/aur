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
source=("https://github.com/downloads/mackyle/xar/xar-1.6.1.tar.gz")
md5sums=('a624535d6a1e8fdf420b36a6b334047b')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
