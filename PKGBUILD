# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname=futhark
pkgver=0.15.1
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

sha1sums=('9a2a8bd82478b9ebcdc0410625fe4d6b49f94753')
sha256sums=('d91472e7f756fcbb4a74b66910ee5b7b1ea965e9f0a8f2a35e30077e9fc3b572')
sha512sums=('2555962ba2504239663fb099bd380a2da7690004a6a6265a3c2e64f32bfd1fda2ea18b4aad7b039239c39e8da39653e4c59eb1af19c7af95a22af919c29c8d1d')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
