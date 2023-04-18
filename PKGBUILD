# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=hpr-scratcher
pkgver=r10.b2762da
pkgrel=1
pkgdesc="Easy scratchpads / drop downs for Hyprland"
arch=(any)
url="https://github.com/hyprland-community/hpr-scratcher"
license=('MIT')
groups=()
depends=('python')
makedepends=('git' 'python-pip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(git+"https://github.com/hyprland-community/hpr-scratcher.git#branch=main")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    pip install --root="${pkgdir}/" .
}
