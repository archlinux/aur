# Maintainer: flacs <0f1ac5@gmail.com>
#
# The package extra/ghidra currently does not build the Eclipse plugins, refer to FS#70255.
# This package extracts the plugins from the upstream release.

pkgname=ghidra-eclipse-plugins-bin
pkgver=10.3.1
_pkgdate=20230614
pkgrel=1
pkgdesc='Eclipse plugins GhidraDev and GhidraSleighEditor'
url='https://www.ghidra-sre.org/'
arch=(any)
license=(Apache)
depends=(ghidra)
optdepends=('eclipse-java: suggested Eclipse package')
source=("https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_${pkgver}_build/ghidra_${pkgver}_PUBLIC_${_pkgdate}.zip")
sha256sums=('0413b679436039cc136b950a6d8c24e80ce79da0a0a48993dfacee671b1c7974')
install="$pkgname.install"
package() {
	for plugin in GhidraDev GhidraSleighEditor
	do
		install -Dt "$pkgdir/opt/ghidra/Extensions/Eclipse/$plugin/" "$srcdir/ghidra_${pkgver}_PUBLIC/Extensions/Eclipse/$plugin/$plugin-"*.zip
	done
}
