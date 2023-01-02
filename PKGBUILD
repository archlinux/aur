# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=futhark-bin
provides=('futhark')
conflicts=('futhark')
pkgver=0.22.7
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

sha1sums=('cdbc72b938bf08eaecf632ce7216df7372658a6b'
            'abc5591d4e49c94371c8397998371bafb50a5bc1')
sha256sums=('bcc78af0283bd5e089382012411999e7e80062588a9ea833315cbfac3806e7fc'
            'd029ffa271dcee84cc883fb9e83744f703401e2abb097b8ef084fff0674d935b')
package() {
    cd "${srcdir}/futhark-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
