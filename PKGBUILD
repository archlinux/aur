# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
pkgname=$_name-bin
pkgver=2.3.148
pkgrel=2
pkgdesc="Command line tools for Azure Functions"
arch=('x86_64')
url="https://github.com/Azure/$_name"
license=('MIT')
optdepends=('dotnet-runtime') # https://github.com/Azure/azure-functions-core-tools/issues/367
options=('staticlibs')
source=("https://github.com/Azure/${_name}/releases/download/${pkgver}/Azure.Functions.Cli.linux-x64.${pkgver}.zip")
sha256sums=('e08bcbe722212702d0e30ef6bfb7edfd96d46934822b13d310ca11daec0d1be1')

package() {
	install -dm 755 "${pkgdir}/opt/${_name}/"
	cp -r "${srcdir}/"* "${pkgdir}/opt/${_name}"
	install -m 755 "func" "${pkgdir}/opt/${_name}/"

	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_name}/func" "${pkgdir}/usr/bin/func"
}
