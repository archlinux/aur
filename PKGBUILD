# Maintainer: fenuks

pkgname=floskell
pkgver=0.10.8
pkgrel=1
pkgdesc='Floskell is flexible Haskell source code pretty printer.'
arch=(x86_64)
url="https://github.com/ennocramer/${pkgname}"
license=("BSD")
makedepends=(stack)  
conflicts=("${pkgname}")
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6e312f9ab13bf224550f9ffd77ee5d03eb27a7165d1fdc20339dbb228daa82e5')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
