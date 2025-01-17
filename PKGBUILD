# Maintainer: fenuks

pkgname=floskell
pkgver=0.11.1
pkgrel=1
pkgdesc='Floskell is flexible Haskell source code pretty printer.'
arch=(x86_64)
url="https://github.com/ennocramer/${pkgname}"
license=("BSD")
makedepends=(stack)
conflicts=("${pkgname}")
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ad039fc93c818d1c61613ab8543d3347f19fa33e19eda52e71a6fedc99193b46')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
