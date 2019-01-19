pkgname=keepass-plugin-qualitycolumn
_pluginname=QualityColumn
pkgver=1.2
pkgrel=2
pkgdesc="Adds support for a 'Password Quality' column in the main entry list."
license=('GPL2')
depends=('keepass')
arch=('any')
url="http://keepass.info/plugins.html#qcol"
source=("http://keepass.info/extensions/v2/qualitycolumn/${_pluginname}-${pkgver}-Source.zip")
sha256sums=('1c0cf9c47bbf7ab527ab50d108f3385a732cb321f9ce7673c703a08fb6e0966d')

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
