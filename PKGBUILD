# Maintainer: fenuks

pkgname=floskell
pkgver=0.10.7
pkgrel=1
pkgdesc='Floskell is flexible Haskell source code pretty printer.'
arch=(x86_64)
url="https://github.com/ennocramer/${pkgname}"
license=("BSD")
makedepends=(stack)  
conflicts=("${pkgname}")
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b46c2bd16aaaf5d118793e622b69bf116aa3dea0d353bc2a573b7b52b7f1ff9b')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
