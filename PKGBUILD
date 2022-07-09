# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=discreet-bin
_pkgname=${pkgname/-bin/}
_githuborg="DiscreetNetwork"
pkgdesc="Discreet Cryptocurrency Wallet. discreet.net"
pkgver=0.0.1
pkgrel=1
arch=('x86_64')
provides=('discreet')
conflicts=('discreet')
depends=('dotnet-sdk')
_pkgpath="github.com/${_githuborg}/${_pkgname}"
url="https://${_pkgpath}"
source=("${url}/releases/download/assets/linux-x64.tar.bz2")
sha256sums=('be503d33f1e875a65cbb1b06727b3b0229bff75fc35b799bd1dcfeae750d07d7')

package() {
	#create directory trees
	_disrcdir=${srcdir}/${_pkgname}-${pkgver}
	_path=${pkgdir}/opt/${_pkgname}
	install -dm755 ${pkgdir}/usr/bin
	install -dm755 ${_path}
	cp -a publish/* ${_path}/
	ln -rTsf ${_path}/${_pkgname^} ${pkgdir}/usr/bin/${_pkgname}
	chmod 755 ${pkgdir}/usr/bin/${i}
}
