# Maintainer: killruana <killruana@gmail.com>
pkgname=yosys
pkgver=0.5
pkgrel=1
epoch=
pkgdesc='A framework for RTL synthesis'
arch=('i686' 'x86_64')
url='http://www.clifford.at/yosys/'
license=('custom:ISC')
depends=('tcl' 'libffi')
optdepends=('graphviz: Schematics display support')
makedepends=('clang')
source=("https://github.com/cliffordwolf/yosys/archive/${pkgname}-${pkgver}.tar.gz" \
        'LICENSE')
sha512sums=('cb81306f07b7ed829ae6aec8685a78ead2d4e0793a6a30b0acebac8574ebc5c7ec41fb3a36cd9865341044519ed3c39dac35c156448e3ba6f275062fa9e64281' \
            'a3202289ff7828c55d3ec3e22d23ed78a34fcae165a7c666d71d3cedd9abe06f638a09750d8c2d43dfca5781f1b32a616f439c3713a12265c02473f88c0f426d')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/usr" install

    install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
