# Contributor: Yuri Albuquerque <yuridenommus at gmail dot com>
pkgname=cl-launch
pkgver=4.1.4
pkgrel=1
pkgdesc="utility to make Lisp software easily invokable from the command-line"
arch=('any')
url="http://www.cliki.net/cl-launch"
license=('LLGPL')
depends=()
source=("http://common-lisp.net/project/xcvb/cl-launch/cl-launch-$pkgver.tar.gz")
md5sums=('bce2d2fa09791ab362e428822e6bc2a1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ## Build
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i s/\@cp/cp/ Makefile

    mkdir -p $pkgdir/usr/bin
    make PREFIX=$pkgdir/usr install
}
