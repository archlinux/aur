# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname=futhark
pkgver=0.13.2
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

sha1sums=('7cc6cfc5c7c0aaf9fb440b8a179095dcc8c53a1d')
sha256sums=('0347b73092492f40fd59da40113020bcb9908f2109e8ba71b8c41afe7db705df')
sha512sums=('c7d7561952f070416d40d3c1f748a04c5194aa9cb6444094850ea42f5eee0621099010193319897b638feef8e3bbeb2514e5d4f13232c22f9f059034b62f48ec')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
