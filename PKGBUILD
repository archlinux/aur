# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=hpr-scratcher
pkgver=0.5.0
pkgrel=1
pkgdesc="Easy scratchpads / drop downs for Hyprland"
arch=(any)
url="https://github.com/hyprland-community/hpr-scratcher"
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
source=(git+"https://github.com/hyprland-community/hpr-scratcher.git#tag=${pkgver}")
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
