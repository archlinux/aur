# Maintainer Marcel Campello <tucho@prafrentex.com.br>
pkgname=customizepkg
pkgver=57.f1d7be7
pkgrel=2
pkgdesc="A tool to modify automatically PKGBUILD" 
url="https://github.com/tucho/customizepkg" 
license=('GPL')
arch=('any')
depends=('bash' 'diffutils') 
provides=('customizepkg')
conflicts=('customizepkg' 'customizepkg-ald' 'customizepkg-patching' 'customizepkg-scripting')
optdepends=(
	'vim: for vimdiff'
	'colordiff: for colored diff output'
)
source=(git+https://github.com/tucho/customizepkg.git) 
sha1sums=('SKIP')

pkgver() {
	cd ${pkgname}
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() { 
	cd ${pkgname}
	install -D -m 755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
	mkdir -p "${pkgdir}"/etc/customizepkg.d/
	cp -R examples/*.example "${pkgdir}"/etc/customizepkg.d/
}
