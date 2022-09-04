# Maintainer: Nathan Balcarcel <nathan.balcarcel@gmail.com>
pkgname='templater-git'
_pkgname='templater'
_destname1='/usr/bin'
pkgver=1.r33.7d813a9
pkgrel=1
pkgdesc="Fill values into a template automatically"
arch=('x86_64')
url="https://github.com/TheTerrior/templater"
license=('GPL')
depends=('git' 'most' 'python')
provides=("templater")
source=('git+https://github.com/TheTerrior/templater.git')
md5sums=('SKIP')

pkgver() {
	cd templater
	printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd templater
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
	cp "${srcdir}/${_pkgname}/templater.py" "${pkgdir}/usr/lib/${_pkgname}/"
	cp "${srcdir}/${_pkgname}/templater.sh" "${pkgdir}/usr/bin/templater"
	chmod +x "${pkgdir}/usr/bin/templater"
}
