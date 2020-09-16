# Maintainer: fenuks

pkgname=floskell
pkgver=0.10.4
pkgrel=2
pkgdesc='Floskell is flexible Haskell source code pretty printer.'
arch=(x86_64)
url="https://github.com/ennocramer/${pkgname}"
license=("BSD")
makedepends=(stack)  
conflicts=("${pkgname}")
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6be5af5f269f5bb084294fb4d18cd47a0c48e530d8f58ead886779e00ef5e17e')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
