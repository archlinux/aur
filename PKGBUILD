# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=sx
pkgver=2.1.1
pkgrel=1
pkgdesc="Simple alternative to startx(1) for starting an Xorg server."
arch=('any')
url="https://github.com/Earnestly/sx"
license=('MIT')
depends=('xorg-server' 'xorg-xauth')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('32f84a14f46ff1c04c49d08cdfcfa6d25d18f4b3aff958794684c5d0e5fd3d5f')

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
