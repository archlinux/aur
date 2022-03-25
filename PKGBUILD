# Maintainer: Arjun Vikram <`echo moc.liamg%rua+kivjra | rev | tr '%' '@'`>

_name=pc2
pkgname=$_name-bin
_baseversion=9.7.0
_buildversion=6181
pkgver=${_baseversion}.${_buildversion}
pkgrel=1
pkgdesc="PC2 aka PC Squared (Programming Contest Control System) software used for competitive programming contests"
arch=('x86_64')
url="https://pc2ccs.github.io/"
license=('EPL2.0')
provides=('pc2')
depends=('java-runtime')
optdepends=()
source=("https://github.com/${_name}ccs/builds/releases/download/v${_baseversion}-${_buildversion}/${_name}-${_baseversion}-${_buildversion}.tar.gz")
sha256sums=("a94ff37afc98e3dfaa69be8e54807a0a7cf94b8a172bc3a4cc8a1f6e6f525c13")
options=('!strip')

package() {
	mkdir -p ${pkgdir}/{opt,usr/bin}
	cp -R  ${_name}-${_baseversion} ${pkgdir}/opt/${_name}
	rm ${pkgdir}/opt/${_name}/${_name}v${_baseversion%%.*}.ini
	echo "#!/bin/bash"$'\n'"exec /opt/${_name}/bin/${_name}team" > ${pkgdir}/usr/bin/${_name}team
	chmod 0755 ${pkgdir}/usr/bin/${_name}team
}
