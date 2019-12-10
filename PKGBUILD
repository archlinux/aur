# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# This PKGBUILD is managed at https://github.com/sudoforge/pkgbuilds

pkgname=git-shelf
pkgver=1.0.0
pkgrel=2
pkgdesc="Store work-in-progress commits on the remote without cluttering the commit history"
arch=('any')
url="https://github.com/sudoforge/${pkgname}"
license=('MIT')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('66f581ad5534459c7faba3a0519f5071a3bb37809434907876a831fc4c054507')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
