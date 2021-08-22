# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nicolas FORMICHELLA <stigpro@outlook.fr>
pkgname=python-requests-docs-html
pkgver=3.0.0
_pkgname="docs-python-requests-org-en-v${pkgver}.zip"
_pkgname2="requests-v${pkgver}"
pkgrel=1
epoch=
pkgdesc="HTML documentation for the python-requests module"
arch=('any')
url="https://docs.python-requests.org/en/master/index.html"
license=('Apache')
groups=()
depends=()
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${_pkgname}::https://docs.python-requests.org/_/downloads/en/v3.0.0/htmlzip/")
noextract=("${_pkgname}")
sha256sums=('b281f41b4dbfa21d3d2574c270abba7bc661a8d456893ca63634402333a1ef15')
validpgpkeys=()

prepare() {
	unzip "$_pkgname"
}

package() {
	cd "$_pkgname2"
	mkdir -p "$pkgdir"/usr/share/doc/python-requests/html
	cp -rf ./* "$pkgdir"/usr/share/doc/python-requests/html/
	find "$pkgdir"/usr/share/doc/python-requests/html/ -type f -exec chmod 0644 {} \;
	find "$pkgdir"/usr/share/doc/python-requests/html/ -type d -exec chmod 0755 {} \;
}
