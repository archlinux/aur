# Author: ava1ar <mail(at)ava1ar(dot)info>

pkgname=customizepkg-git
_pkgname=customizepkg
pkgver=34.1c635e8
pkgrel=1
pkgdesc="A tool to modify automatically PKGBUILD" 
url="https://github.com/ava1ar/customizepkg" 
license=('GPL')
arch=('any')
depends=('bash' 'diffutils') 
privides=('customizepkg')
conflicts=('customizepkg' 'customizepkg-ald' 'customizepkg-patching' 'customizepkg-scripting')
optdepends=(
	'vim: for vimdiff'
	'colordiff: for colored diff output'
)
source=(git+https://github.com/ava1ar/customizepkg.git) 
sha1sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() { 
	cd ${_pkgname}
	install -D -m 755 ${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
	mkdir -p "${pkgdir}"/etc/customizepkg.d/
	cp -R examples/*.example "${pkgdir}"/etc/customizepkg.d/
}
