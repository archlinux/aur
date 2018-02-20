# Maintainer: Niklas <dev@n1klas.net>

pkgname=extra-firewalld-services
pkgver=1
pkgrel=1
pkgdesc="A collection of additional service files not included with Firewalld"
arch=(any)
url="https://github.com/flak3/extra-firewalld-services"
license=('custom:CC0')
depends=('firewalld')
source=("https://github.com/flak3/extra-firewalld-services/archive/${pkgver}.tar.gz")
sha512sums=('951f3256dc885ec2cd09c9f7f69f431f85e74b5c4fe420ddc9fed6d30f548277369489ecad58685a662209b7ee78791ca96fafc1738801dffb9a38d4f9006da1')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/usr/lib/firewalld/services"
    install -Dm644 services/* "${pkgdir}/usr/lib/firewalld/services"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
