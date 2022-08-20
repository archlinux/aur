# Maintainer: Martin Rys <rys.pw/contact>

pkgname=http-server-upload
pkgver=2.0.1
pkgrel=1
epoch=
pkgdesc="Zero-configuration command-line http server which provides a lightweight interface to upload files."
arch=('x86_64')
url="https://github.com/crycode-de/http-server-upload"
license=('MIT')
groups=()
depends=()
makedepends=('npm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('f3ff6b766299e92084f6a93facbc1581a4dcf4fff884e29f4a49322875522f9f')
validpgpkeys=()

package() {
	npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"
}
