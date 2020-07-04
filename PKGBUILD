# Mantainer: Dudemanguy <random342@airmail.cc>
pkgname=password-sanity-git
_pkgname=password-sanity
pkgver=0.3_6_g7cedd8d
pkgrel=1
license=("GPL3")
pkgdesc="A simple, python program for securely managing passwords through the command line"
depends=("python" "python-gnupg")
arch=("x86_64")
url="https://github.com/Dudemanguy/password-sanity"
source=("${_pkgname}::git+https://github.com/Dudemanguy/password-sanity.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "%s" "$(git describe --tags)" | sed s/-/_/g
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" python setup.py install --root="${pkgdir}" --optimize=1
}
