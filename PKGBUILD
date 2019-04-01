# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
pkgname=$_name-bin
pkgver=2.5.553
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
sha256sums=('766c33f2fd135be8fc5fa202ade8ef6ffdd03b3d340ca71926ec9984ff788532')

package() {
	install -dm 755 "${pkgdir}/usr/lib/${_name}/"
	cp -r "${srcdir}/"* "${pkgdir}/usr/lib/${_name}"
	install -m 755 "func" "${pkgdir}/usr/lib/${_name}/"

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_name}/func" "${pkgdir}/usr/bin/func"
}
