# Maintainer: Arafat Zahan <kuasha420@gmail.com>
pkgname=python-simplepam-git
_pkgname=python-simplepam
pkgver=r31.b81a806
pkgrel=2
pkgdesc="Pure Python interface to the Pluggable Authentication Modules system on Linux. Git version"
arch=('any')
url="https://github.com/leonnnn/python3-simplepam/"
license=("MIT")
depends=("python" "pam")
makedepends=("git" "python")
source=("${pkgname%-*}::git+https://github.com/leonnnn/python3-simplepam.git")
sha1sums=("SKIP")
provides=("python-simplepam")
conflicts=("python-simplepam")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    python3 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
