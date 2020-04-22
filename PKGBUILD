# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=futhark-bin
provides=('futhark')
conflicts=('futhark')
pkgver=0.15.4
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

sha1sums=('82ad3773f7f8fad1baa731875c87e701a76fbb0f'
          '2dfe6c31d88ac99b9cbc9328985d41c0cbcc06b7')
sha256sums=('2421534c6ed26cf38c9c287af33639fa9533bcdd901e86cd1906b33e62d40595'
            '7475fca879af2d0c57e9ef09a1228c71096f076aa4b6cd23e60a1f66bf213b91')
sha512sums=('521dc1673b4e7db51db2f632f09a9d000bd6faf043844147df3631969bebf6f2d7ec03ebca272baa366afc6735e9381ba2980082b8b1e2c96127b302dda9b764'
            '735147f8c5feb38e20200904a78097b802e3974a7780691ab00eb4f000acb3f7d77d2f4a92cfe1c1c42303b41986253533bc05ee60bb917a142e3c58f51c34d3')

package() {
    cd "${srcdir}/futhark-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
