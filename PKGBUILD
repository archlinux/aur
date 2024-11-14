# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>
# Maintainer: redponike <proton (dot) me>

pkgname=futhark-bin
provides=('futhark')
conflicts=('futhark')
pkgver=0.25.24
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

sha1sums=('6d635ce80bc4b6a9053465d686b3076fdda2709d'
          'abc5591d4e49c94371c8397998371bafb50a5bc1')
sha256sums=('4260a1977f0fa2023feff463016365378e5a1658d80c8c30417b9edac2b89aa4'
            'd029ffa271dcee84cc883fb9e83744f703401e2abb097b8ef084fff0674d935b')
package() {
    cd "${srcdir}/futhark-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
