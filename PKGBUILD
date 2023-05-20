# Maintainer: Joey Holtzman <joeyholtzman0507 at gmail dot com>

pkgname=pacman-venv
pkgver=0.3
pkgrel=1
pkgdesc="A tool to create virtual environments for Pacman"
arch=('x86_64')
url="https://github.com/jdholtz/pacman-venv"
license=('MIT')
depends=('bash' 'pacman' 'sudo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jdholtz/pacman-venv/archive/v${pkgver}.tar.gz")
sha512sums=(6bd82f228df9d4e4df01e4300ce0834d4c63a3ff7e79cd1932f881e4d14e5ad1336c365fc12cb3d291c2ee234c0f4735bfa0ded50509386a44057a4c4e58d99c)

package() {
	cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
