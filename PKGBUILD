# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=futhark-bin
provides=('futhark')
conflicts=('futhark')
pkgver=0.19.7
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

sha1sums=('4e72bcc9fabc6dd2e26a618cc841390541e7ab9a'
          '2dfe6c31d88ac99b9cbc9328985d41c0cbcc06b7')
sha256sums=('f283524683c92d925f275e075f3a8c4a078ad219c595635945a280398fb8f1c0'
            '7475fca879af2d0c57e9ef09a1228c71096f076aa4b6cd23e60a1f66bf213b91')
b3sums=('f6fe4dbf81d885b8c59b0735468c8cd2050d8b1f4471d24ced92569be0e1f10507f2a58493ebcde821a1a2e7f33c580c43ca487f7dd083e0060728444fe77719'
            '735147f8c5feb38e20200904a78097b802e3974a7780691ab00eb4f000acb3f7d77d2f4a92cfe1c1c42303b41986253533bc05ee60bb917a142e3c58f51c34d3')

package() {
    cd "${srcdir}/futhark-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
