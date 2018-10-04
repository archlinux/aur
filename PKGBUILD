# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# This PKGBUILD is managed at https://github.com/sudoforge/pkgbuilds

pkgname=git-cleanup
pkgver=1.0.0
pkgrel=1
pkgdesc="Easily remove merged and deleted branches from local and remote repositories."
arch=('any')
url="https://github.com/sudoforge/${pkgname}"
license=('MIT')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('9d562d99785ea9a02a686a0b54074c8cb70be7e0d36f773e51f43bcf30b4d9a9')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
