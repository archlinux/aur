# Maintainer: Mikael Blomstrand <chawlindel+aur@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>
pkgname=futhark
pkgver=0.12.2
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
sha512sums=('a97904fee223b78d71d11ac878613a883fcb0f5451f070bfbc9f366c5b0b35a5cbf98ac7e8d6e869e31f8997901937a6bb6762dd854e3c4bdc48756bde863ab3')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
