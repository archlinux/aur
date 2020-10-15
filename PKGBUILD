# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=futhark-bin
provides=('futhark')
conflicts=('futhark')
pkgver=0.18.5
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

sha1sums=('259ed3fc5866788645a36b5441a2d5b92943da57'
          '2dfe6c31d88ac99b9cbc9328985d41c0cbcc06b7')
sha256sums=('6288c7888e02111210a5393f1c4b664be19d53308a4ed7fa8645ed76c0f88b19'
            '7475fca879af2d0c57e9ef09a1228c71096f076aa4b6cd23e60a1f66bf213b91')
sha512sums=('bf3155c1a04f2c234037fd2e9d1ddc96f1cb0ce96e63223607d960ce81bf275cc6c704fc92f2a98906b02da7ce0aa9e9e7e304936228c2a30b8a9fc8f4758683'
            '735147f8c5feb38e20200904a78097b802e3974a7780691ab00eb4f000acb3f7d77d2f4a92cfe1c1c42303b41986253533bc05ee60bb917a142e3c58f51c34d3')

package() {
    cd "${srcdir}/futhark-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
