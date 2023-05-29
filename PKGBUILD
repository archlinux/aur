# Maintainer: Joey Holtzman <joeyholtzman0507 at gmail dot com>

pkgname=pacman-venv
pkgver=0.4
pkgrel=1
pkgdesc="A tool to create virtual environments for Pacman"
arch=('x86_64')
url="https://github.com/jdholtz/pacman-venv"
license=('MIT')
depends=('bash' 'pacman' 'sudo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jdholtz/pacman-venv/archive/v${pkgver}.tar.gz")
sha512sums=(143d87e23d8006fbe370de7ae43e5e52fc95f1697eeb65c148ee2b1db9e8ebd92e99900ad823c406406ac43b9bd235b71769520c18be9fd08d6de3c06182cfca)

package() {
	cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
