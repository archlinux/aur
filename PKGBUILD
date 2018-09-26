# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# This PKGBUILD is managed at https://github.com/sudoforge/pkgbuilds

pkgname=git-shelf
pkgver=1.0.0
pkgrel=1
pkgdesc="Store work-in-progress commits on the remote without cluttering the commit history"
arch=('any')
url="https://github.com/sudoforge/${pkgname}"
license=('MIT')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('398fb7b50179d30ea1e7913fb696d7aa2edbbfd05ecb8182006eb661afaa2270')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
