# Maintainer: René Wagner <rwa at clttr dot info>
pkgname=art-rawconverter-ctlscripts
pkgver=1.1
pkgrel=1
pkgdesc="add on for ART raw converter with various CTL scripts"
arch=('i686' 'x86_64' 'aarch64')
url="https://bitbucket.org/agriggio/art-ctlscripts/"
license=('GPL3')
depends=('art-rawconverter' 'ctl')
makedepends=('pkgconf' 'git' 'fakeroot')
source=("${pkgname}_${pkgver}::git+https://bitbucket.org/agriggio/art-ctlscripts.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
	rm -rf "${srcdir}/${pkgname}_${pkgver}/.gitignore"
	rm -rf "${srcdir}/${pkgname}_${pkgver}/.git/"
}

package() {
	mkdir -p "${pkgdir}/usr/share/ART/ctlscripts/"
	cd "${srcdir}/${pkgname}_${pkgver}"
	find . -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/ART/ctlscripts/{}" \;
}
