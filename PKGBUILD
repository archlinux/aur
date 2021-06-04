# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=4
pkgver=4.25.2
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('custom')
install="${pkgname}.install"
source=(
    "$pkgname-$pkgver.gz::https://github.com/symfony/cli/releases/download/v${pkgver}/symfony_linux_amd64.gz"
    'eula.txt'
)
sha256sums=('8bfa53c1479883e9b48d2e4e5d3f6f7a511df73d65fe5c7b07a4890ee2c75c7e'
            '46711d74e64aa4a26ae257063b795c432113b56fb80d1a69ffaa7b0b079dcf11')

package() {
    install -D -m 755 "${srcdir}/$pkgname-$pkgver" "${pkgdir}/usr/bin/symfony"
    install -D -m 644 eula.txt "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"
}
