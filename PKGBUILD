# Maintainer: Sebastian Wilzbach <sebi [at] wilzbach [dot] me>
# Contributor: Cory Giles <mail@corygil.es>

pkgname=bedops
pkgver=2.4.14
pkgrel=1
pkgdesc="Highly scalable genomic feature operations."
arch=('i686' 'x86_64')
url="http://github.com/bedops/bedops/"
license=('GPL')
depends=('python2')

if [ "$CARCH" == "x86_64" ]; then
md5sums=('5c1555eec064e43a4d153156671c9795')
    _arch="$CARCH"
else
    _arch="i386"
fi

source=(https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_${_arch}-v${pkgver}.tar.bz2)

build() {
    cd "$srcdir"
    sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/g' bin/*
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin"
    install -t "$pkgdir/usr/bin" bin/*
}
