# Maintainer: René Wagner <rwa at clttr dot info>
pkgname=art-rawconverter-ctlscripts
pkgver=1.2
pkgrel=1
pkgdesc="addon for ART raw converter with various CTL scripts"
arch=('i686' 'x86_64' 'aarch64')
url="https://art.pixls.us"
license=('GPL3')
depends=('art-rawconverter' 'ctl')
makedepends=('pkgconf' 'git' 'fakeroot')
source=("${pkgname}::git+https://github.com/artpixls/ART-ctlscripts.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
	rm -rf "${srcdir}/${pkgname}/.gitignore"
	rm -rf "${srcdir}/${pkgname}/.git/"
}

package() {
	mkdir -p "${pkgdir}/usr/share/ART/ctlscripts/"
	cd "${srcdir}/${pkgname}"
	find . -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/ART/ctlscripts/{}" \;
}
