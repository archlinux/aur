# Maintainer: fenuks

pkgname=floskell
pkgver=0.10.5
pkgrel=1
pkgdesc='Floskell is flexible Haskell source code pretty printer.'
arch=(x86_64)
url="https://github.com/ennocramer/${pkgname}"
license=("BSD")
makedepends=(stack)  
conflicts=("${pkgname}")
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('91aa7caa269d1df60c7b21226721e0bd0e8595308b0d3f56dfd5e775b2d1f9ab')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
