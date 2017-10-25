# Maintainer: DenBrahe <denbrahe at hotmail dot com>
# Contributor: Knowledge Representation and Reasoning research group, KU Leuven

_major_version=3.6
_minor_version=0

pkgname=idp
pkgver=${_major_version}.${_minor_version}
pkgrel=4
pkgdesc="Knowledge Base System"
arch=('i686' 'x86_64')
url="http://dtai.cs.kuleuven.be/software/idp"
license=('LGPL3')
install=idp.install
depends=('sh')
md5sums=('6d521d83bf5b7516c00f34c7e5f369bd')

_dirname="$pkgname-${_major_version}.${_minor_version}-Linux"

source=("https://dtai.cs.kuleuven.be/krr/files/releases/$pkgname/${_major_version}.${_minor_version}/${_dirname}.tar.gz")


package() {
	cd ${srcdir}
	rm ${_dirname}.tar.gz

	targetdir=${pkgdir}/opt/idp
	mkdir -p ${targetdir}
	cp -dR ./${_dirname}/* ${targetdir}/

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/idp/bin/idp" "${pkgdir}/usr/bin/idp"
}
