# Maintainer: Sebastian Larsen Prehn <slp (at) sebastianprehn (dot) dk>
# Contributor: redponike <proton (dot) me>
# Contributor: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=futhark-bin
provides=('futhark')
conflicts=('futhark')
pkgver=0.25.37
pkgrel=1
pkgdesc="A data-parallel functional programming language."
arch=('x86_64')
url='https://futhark-lang.org/'
license=('LicenseRef-ISC')
depends=()
options=('!debug')
optdepends=('opencl-headers: OpenCL backend'
            'cuda: CUDA backend'
            'python-pyopencl: PyOpenCL backend')
source=("https://github.com/diku-dk/futhark/releases/download/v${pkgver}/futhark-${pkgver}-linux-x86_64.tar.xz"
		"LICENSE-${pkgname}-${pkgver}::https://raw.githubusercontent.com/diku-dk/futhark/v${pkgver}/LICENSE")

sha256sums=('de61b2e2d92506de00f6597ff190ec6febfd2118104c70cb15db71a28bb20fe8'
            'd029ffa271dcee84cc883fb9e83744f703401e2abb097b8ef084fff0674d935b')


package() {
    cd "${srcdir}/futhark-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 "${srcdir}/LICENSE-${pkgname}-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
