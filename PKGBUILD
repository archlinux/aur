pkgname=keepass-plugin-qualitycolumn
_pluginname=QualityColumn
pkgver=1.3
pkgrel=1
pkgdesc="Adds support for a 'Password Quality' column in the main entry list."
license=('GPL2')
depends=('keepass')
arch=('any')
url="http://keepass.info/plugins.html#qcol"
source=("http://keepass.info/extensions/v2/qualitycolumn/${_pluginname}-${pkgver}-Source.zip")
sha256sums=('87b48fa34838c10302f18d23d719461627d44fa4eca4acbe3cbd03bd194ade58')

prepare() {
	mkdir build
	cp -r Properties *.cs *.csproj *.sln build/
}

build() {
	keepass --plgx-create "${srcdir}/build"
}

package() {
	install -Dm644 "${srcdir}/build.plgx" "${pkgdir}/usr/share/keepass/plugins/${_pluginname}.plgx"
}
