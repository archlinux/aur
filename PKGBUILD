# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
pkgname=$_name-bin
pkgver=2.4.290
pkgrel=1
pkgdesc="Command line tools for Azure Functions"
arch=('x86_64')
url="https://github.com/Azure/$_name"
license=('MIT')
optdepends=('dotnet-runtime') # https://github.com/Azure/azure-functions-core-tools/issues/367
options=('staticlibs')
source=("https://github.com/Azure/${_name}/releases/download/${pkgver}/Azure.Functions.Cli.linux-x64.${pkgver}.zip")
sha256sums=('e9801462e8e9da05f97764d1c087c19c3ff6c85228b780e64ff7137d29432b0f')

package() {
	install -dm 755 "${pkgdir}/opt/${_name}/"
	cp -r "${srcdir}/"* "${pkgdir}/opt/${_name}"
	install -m 755 "func" "${pkgdir}/opt/${_name}/"

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_name}/func" "${pkgdir}/usr/bin/func"
}
