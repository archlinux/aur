# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname=futhark
pkgver=0.15.3
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

sha1sums=('f3eaeef88a3d59d908c126a73f8d55a884f59386')
sha256sums=('df90f913a0fab7d3e1b7dcfcea1d777f637b65301ca4269384f02d5b076747cf')
sha512sums=('2717779cd805cec88a27d65b0cbb4114be78274f815f18224a28a9401ebfc8d7c752ed9aebec346ace9990dde129cb04d46e67ef55888cf3915427b4d4c9aa1f')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
