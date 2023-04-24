# Maintainer: Joey Holtzman <joeyholtzman0507 at gmail dot com>

pkgname=pacman-venv
pkgver=0.1
pkgrel=1
pkgdesc="A tool to create virtual environments for Pacman"
arch=('x86_64')
url="https://github.com/jdholtz/pacman-venv"
license=('MIT')
depends=('bash' 'pacman' 'sudo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jdholtz/pacman-venv/archive/v${pkgver}.tar.gz")
sha512sums=(0a774a82a0bd6dbb29000533cb325e8c6479b2454f750d691d4e34fcf4cf91b8a196f7eaaccd604c0802cba487eb24645e6c4f899b6d1fe599813cf73d7fe11d)

package() {
	cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
