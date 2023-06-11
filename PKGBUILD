# Maintainer: flacs <0f1ac5@gmail.com>
#
# The package extra/ghidra currently does not build the Eclipse plugins, refer to FS#70255.
# This package extracts the plugins from the upstream release.

pkgname=ghidra-eclipse-plugins-bin
pkgver=10.3
_pkgdate=20230510
pkgrel=1
pkgdesc='Eclipse plugins GhidraDev and GhidraSleighEditor'
url='https://www.ghidra-sre.org/'
arch=(any)
license=(Apache)
depends=(ghidra)
optdepends=('eclipse-java: suggested Eclipse package')
source=("https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_${pkgver}_build/ghidra_${pkgver}_PUBLIC_${_pkgdate}.zip")
sha256sums=('4e990af9b22be562769bb6ce5d4d609fbb45455a7a2f756167b8cdcdb75887fc')
install="$pkgname.install"
package() {
	for plugin in GhidraDev GhidraSleighEditor
	do
		install -Dt "$pkgdir/opt/ghidra/Extensions/Eclipse/$plugin/" "$srcdir/ghidra_${pkgver}_PUBLIC/Extensions/Eclipse/$plugin/$plugin-"*.zip
	done
}
