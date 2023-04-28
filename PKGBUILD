# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=pyprland
pkgver=1.0.2
pkgrel=2
pkgdesc="Easy scratchpads, smart monitor placement and more Hyprland tweaks"
arch=(any)
url="https://github.com/fdev31/pyprland"
license=('MIT')
groups=()
depends=('python')
makedepends=('git' 'python-pip')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(git+"https://github.com/fdev31/pyprland.git#tag=${pkgver}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git checkout ${pkgver}
	printf "%s" "$(git describe --tags)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    pip install --root="${pkgdir}/" .
}
