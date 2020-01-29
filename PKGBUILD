# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname=futhark
pkgver=0.14.1
pkgrel=1
pkgdesc="A data-parallel functional programming language."
arch=('x86_64')
url='https://futhark-lang.org/'
license=('ISC')
depends=('ncurses5-compat-libs' 'zlib')
optdepends=('opencl-headers: OpenCL backend'
            'cuda: CUDA backend'
            'python-pyopencl: PyOpenCL backend')
source=("https://github.com/diku-dk/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x86_64.tar.xz")

sha1sums=('4740453581d6dc2d48615db7a9c2953901603b43')
sha256sums=('f6b92bb3f2661ce82959f3d3839ab2d22b09cd18fa4c21c2d01319a061d7fd85')
sha512sums=('148ba96ef1a78b0df2f38b61ce87f6362fadd6ab19d9fb4625a91b9796cd09d99158293000bc2c407fc520ac54ac1805f331fb9a542d552869d489f7d1738893')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
