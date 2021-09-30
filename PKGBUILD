# Maintainer: Martin Rys <rys.pw/contact>

pkgname=http-server-upload
pkgver=1.1.0
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
sha256sums=('d87ac7f2fd2cb99472e2f080affbc336250d81d81a985390dab8efb6193fc1e3')
validpgpkeys=()

package() {
	npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"
}
