# Maintainer: Leo <i@setuid0.dev>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>

pkgname=psysh
pkgver=0.10.8
pkgrel=1
pkgdesc="A runtime developer console, interactive debugger and REPL for PHP."
url="https://psysh.org/"
arch=('x86_64')
license=('MIT')
depends=('php')
install=.install
source=(
	"https://github.com/bobthecow/psysh/releases/download/v${pkgver}/psysh-v${pkgver}.tar.gz"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/bobthecow/psysh/v${pkgver}/LICENSE"
)
sha256sums=(
	'ea8a5204a479788e4795a272e00f7826bc587d4b4208d565ca7b662d96d67ce1'
	'ea877138671d7068328bf698de950f09a13429ff49096202414472ffbdeeab66'
)

package() {
	cd "${srcdir}"
	install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
