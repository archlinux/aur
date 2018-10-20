# Maintainer: Benoît Allard <benoit dot allard at gmx dot de>
# Contributor: killruana <killruana@gmail.com>
pkgname=yosys
pkgver=0.8
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
sha512sums=('92364592f755b77bca5efaa99ed8050f4278a406066601a217c567e238ad2f59f9d85b7c91295dbd7125b2f9a0da74c511e238d8ae996bba1cd4aace71dc3d10'
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
