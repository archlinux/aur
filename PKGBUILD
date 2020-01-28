# Maintainer: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>
pkgname=kplot
pkgver=0.1.15
pkgrel=1
pkgdesc="Cairo plotting library"
arch=('i686' 'x86_64')
license=('ISC')
depends=('cairo' 'libbsd')
url="https://kristaps.bsd.lv/kplot/"

_pkgname="${pkgname}-${pkgver}"
source=("https://kristaps.bsd.lv/kplot/snapshots/kplot.tgz" "linux.patch")
sha1sums=('f894b9634dde97df3731f1155649350080b8bf8a' 'ce9ac134f39fd7a1b17c74a9cbc3df436522adac')

prepare() {
        cd "${_pkgname}"
        patch --verbose -p1 < ../linux.patch
}

build() {
        cd "${_pkgname}"
        make
}

package() {
        cd "${_pkgname}"
        make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
