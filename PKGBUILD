# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=sx
pkgver=2.1.2
pkgrel=1
pkgdesc="Simple alternative to startx(1) for starting an Xorg server."
arch=('any')
url="https://github.com/Earnestly/sx"
license=('MIT')
depends=('xorg-server' 'xorg-xauth')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('51f816ce31271b88f30b5dbd0cffa8909b0668c49642b3c1af555065371fc756')
b2sums=('d20bb2cb650c27da1323e35a02044ebcdf046ef42cf5fe6df4f350274683f76656d9168a6b5d6e5e3187996412e5dde5eb3d44b1bb62145dc48180d2f0326224')

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
