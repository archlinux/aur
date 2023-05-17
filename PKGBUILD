# Maintainer: Joey Holtzman <joeyholtzman0507 at gmail dot com>

pkgname=pacman-venv
pkgver=0.2
pkgrel=1
pkgdesc="A tool to create virtual environments for Pacman"
arch=('x86_64')
url="https://github.com/jdholtz/pacman-venv"
license=('MIT')
depends=('bash' 'pacman' 'sudo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jdholtz/pacman-venv/archive/v${pkgver}.tar.gz")
sha512sums=(64374ad173cbdbebc3af0fbc2b62a9eb1ca6b787f8ecf02bb613a550a6d50f8c1eb5fc513cf9555d8c201292ba1edd7a7beee9535a31ea6dc4028a0d96ce1d2f)

package() {
	cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
