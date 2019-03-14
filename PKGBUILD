# Maintainer: Arafat Zahan <kuasha420@gmail.com>
pkgname=pyxtrlock-git
_pkgname=pyxtrlock
pkgver=r145.c8f55b9 
pkgrel=1
pkgdesc="The X transparent screen lock rewritten in Python. Git version"
arch=('any')
url="https://github.com/leonnnn/pyxtrlock/"
license=("GPLv3+")
depends=("python" "python-xdg" "python-simplepam")
makedepends=("git")
source=("${pkgname%-*}::git+https://github.com/leonnnn/pyxtrlock.git")
sha1sums=("SKIP")
provides=("pyxtrlock")
conflicts=("pyxtrlock")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    python3 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
