# Maintainer: Foppe Hemminga "Afwas" <foppe@foppe.org>

pkgname=ssh-restrict-git
_pkgname=ssh-restrict
pkgver=20150523
pkgrel=1
pkgdesc="whitelist remote commands via ssh config"
arch=('any')
url="https://github.com/mxey/ssh-restrict"
license=('BSD')
makedepends=('git')
depends=('python2' 'python2-configparser')
source=("${_pkgname}::git+https://github.com/mxey/${_pkgname}.git#branch=HEAD")
md5sums=('SKIP')

build() {
	sed -i.bak 's/python/python2/' "${srcdir}/${_pkgname}/ssh-restrict"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
	install -d -m755 "${pkgdir}/usr/share/licences/${_pkgname}"
	install -Dm644 "ssh-restrict" "${pkgdir}/usr/bin/ssh-restrict"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}"
	
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}
