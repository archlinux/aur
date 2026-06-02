# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
pkgname=$_name-bin
pkgver=4.12.0 # renovate: datasource=github-tags depName=Azure/azure-functions-core-tools
pkgrel=1
pkgdesc="Command line tools for Azure Functions"
arch=('x86_64')
url="https://github.com/Azure/$_name"
license=('MIT')
provides=($_name)
conflicts=($_name)
optdepends=('dotnet-runtime: to install extensions') # https://github.com/Azure/azure-functions-core-tools/issues/367
options=('staticlibs')
source=("https://github.com/Azure/${_name}/releases/download/${pkgver}/Azure.Functions.Cli.linux-x64.${pkgver}.zip")
b2sums=('95b50332bdeaeca2e53c88b1b2d7241e4b11060974e3bfa5e96765368667ec0c4dc5868eda6e83005be40767fe15c9d6ff073b4b17965c69dd12ef38bfd0f73c')

package() {
	install -dm 755 "${pkgdir}/usr/lib/${_name}/"
	cp -r "${srcdir}/"* "${pkgdir}/usr/lib/${_name}"
	install -m 755 "func" "${pkgdir}/usr/lib/${_name}/"

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_name}/func" "${pkgdir}/usr/bin/func"
}
