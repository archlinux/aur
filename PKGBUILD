# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=4
pkgver=4.27.2
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('custom')
install="${pkgname}.install"
source=(
    "$pkgname-$pkgver.gz::https://github.com/symfony/cli/releases/download/v${pkgver}/symfony_linux_amd64.gz"
    'eula.txt'
)
sha256sums=('a9be8daa9e4c2b6475dd612061c6236dc39a910584e0ab688f706d90d57ca9de'
            '46711d74e64aa4a26ae257063b795c432113b56fb80d1a69ffaa7b0b079dcf11')

package() {
    install -D -m 755 "${srcdir}/$pkgname-$pkgver" "${pkgdir}/usr/bin/symfony"
    install -D -m 644 eula.txt "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"
}
