# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=futhark-bin
provides=('futhark')
conflicts=('futhark')
pkgver=0.18.1
pkgrel=1
pkgdesc="A data-parallel functional programming language."
arch=('x86_64')
url='https://futhark-lang.org/'
license=('custom:ISC')
depends=('ncurses5-compat-libs' 'zlib')
optdepends=('opencl-headers: OpenCL backend'
            'cuda: CUDA backend'
            'python-pyopencl: PyOpenCL backend')
source=("https://github.com/diku-dk/futhark/releases/download/v${pkgver}/futhark-${pkgver}-linux-x86_64.tar.xz"
		"https://raw.githubusercontent.com/diku-dk/futhark/v${pkgver}/LICENSE")

sha1sums=('be297e7abf75167a0bb2091f669617073e02ce97'
          '2dfe6c31d88ac99b9cbc9328985d41c0cbcc06b7')
sha256sums=('ed90615c48d2b44129a5febb52a7b31b8d0e97e17bd4f8ab73396d9b59205b8f'
            '7475fca879af2d0c57e9ef09a1228c71096f076aa4b6cd23e60a1f66bf213b91')
sha512sums=('f6fe4dbf81d885b8c59b0735468c8cd2050d8b1f4471d24ced92569be0e1f10507f2a58493ebcde821a1a2e7f33c580c43ca487f7dd083e0060728444fe77719'
            '735147f8c5feb38e20200904a78097b802e3974a7780691ab00eb4f000acb3f7d77d2f4a92cfe1c1c42303b41986253533bc05ee60bb917a142e3c58f51c34d3')

package() {
    cd "${srcdir}/futhark-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
