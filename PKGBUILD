# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=futhark-bin
provides=('futhark')
conflicts=('futhark')
pkgver=0.15.8
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

sha1sums=('8d00e398e614248d4c9c49666f9dce91581cd44f'
          '2dfe6c31d88ac99b9cbc9328985d41c0cbcc06b7')
sha256sums=('698790323d7c2f2fe7288c5030fbe74eb013351bd11402c15048db4c88971b73'
            '7475fca879af2d0c57e9ef09a1228c71096f076aa4b6cd23e60a1f66bf213b91')
sha512sums=('682ae1c0082ecad3c294ee7742c0f6cee0730c27b3d6470e9ee24b13bbc390776ed0bfd25fd8031757a1fbd454d42cb0c02b5e7f8f9f44bf51166bd810077abf'
            '735147f8c5feb38e20200904a78097b802e3974a7780691ab00eb4f000acb3f7d77d2f4a92cfe1c1c42303b41986253533bc05ee60bb917a142e3c58f51c34d3')

package() {
    cd "${srcdir}/futhark-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
