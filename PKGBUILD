# Maintainer: Niklas <dev@n1klas.net>

pkgname=extra-firewalld-services
pkgver=2
pkgrel=1
pkgdesc="A collection of additional service files not included with Firewalld"
arch=(any)
url="https://github.com/flak3/extra-firewalld-services"
license=('custom:CC0')
depends=('firewalld')
source=("https://github.com/flak3/extra-firewalld-services/archive/${pkgver}.tar.gz")
sha512sums=('365340dba9e7680270cf9fb99272fb64924a97fd761c4b8db0b8470ff5e902f47a1bb826c2bb46e9751597679354dd862e5b0f146dbb33aefb4dfc0ee2a81588')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/usr/lib/firewalld/services"
    install -Dm644 services/* "${pkgdir}/usr/lib/firewalld/services"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
