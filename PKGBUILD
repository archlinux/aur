# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=sx
pkgver=2.1.5
pkgrel=1
pkgdesc="Simple alternative to startx(1) for starting an Xorg server."
arch=('any')
url="https://github.com/Earnestly/sx"
license=('MIT')
depends=('xorg-server' 'xorg-xauth')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f12a8312ac7f8393bbce07ef1371d38dd30f11be26912e9184e1e51ec606b4be')
b2sums=('2e6d7e7c1d3c2a08433c2e7542cf56b71a8421e8d58380328e2f9c2310245eab7ecc2073614124a06cb4e547329c3b4b1318bfd22de3862f30aadc32d0dbae73')

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
