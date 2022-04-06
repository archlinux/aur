# Maintainer: BadAtNames <badatnames@tutanota.com>

pkgname=x86-manpages-git
_pkgname="${pkgname%%-git}"
pkgver=v0.9.1.r3.g94902f9
pkgrel=1
pkgdesc="Man page documentation for x86-64 ISA"
arch=('any')
url="https://github.com/ttmo-O/x86-manpages"
source=("git+https://github.com/ttmo-O/x86-manpages.git")
sha256sums=('SKIP')
depends=('man-db')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	mkdir -p "${pkgdir}/usr/share/man/man7"
	cd "${srcdir}/${_pkgname}"
	install -m 644 -C man7/* "${pkgdir}/usr/share/man/man7/"
}
