# Maintainer: killruana <killruana@gmail.com>
pkgname=yosys
pkgver=0.7
pkgrel=1
epoch=
pkgdesc='A framework for RTL synthesis'
arch=('i686' 'x86_64')
url='http://www.clifford.at/yosys/'
license=('custom:ISC')
depends=('tcl' 'libffi')
optdepends=('graphviz: Schematics display support')
makedepends=('clang' 'mercurial')
source=("https://github.com/cliffordwolf/yosys/archive/${pkgname}-${pkgver}.tar.gz" \
        'LICENSE')
sha512sums=('459de12ea2b7b22ecbfcb0a6921ed0355a820dca45728bcb20dd50f553be4ab6e9916f5c01425368ff945e62c69e4001a209ae45fcd4803617ca82611b02990c'
            'a3202289ff7828c55d3ec3e22d23ed78a34fcae165a7c666d71d3cedd9abe06f638a09750d8c2d43dfca5781f1b32a616f439c3713a12265c02473f88c0f426d')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    make PREFIX="/usr"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install

    install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
