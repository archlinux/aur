# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>
pkgname=kicad-interactivehtmlbom-git
pkgdesc="Interactive HTML BOM generation plugin for KiCad"
pkgver=v2.3.r15.g09afbae
pkgrel=1

url="https://github.com/openscopeproject/InteractiveHtmlBom"
arch=("any")
license=("MIT")

depends=("kicad>=5.1.0")

source=("$pkgname::git+https://github.com/openscopeproject/InteractiveHtmlBom.git")

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	# copy plugin module
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/share/kicad/scripting/plugins/InteractiveHtmlBom"
	cp -r InteractiveHtmlBom "$pkgdir"/usr/share/kicad/scripting/plugins/
	
	# install license
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/InteractiveHtmlBom/LICENSE
}

md5sums=('SKIP')
	
