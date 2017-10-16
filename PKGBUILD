# Maintainer: DenBrahe <denbrahe at hotmail dot com>
# Contributor: Knowledge Representation and Reasoning research group, KU Leuven

_major_version=3.6
_minor_version=0

pkgname=idp
pkgver=${_major_version}.${_minor_version}
pkgrel=3
pkgdesc="Knowledge Base System"
arch=('i686' 'x86_64')
url="http://dtai.cs.kuleuven.be/software/idp"
license=('LGPL3')
install=idp.install
makedepends=('cmake'
             'texlive-bin')
depends=('sh')
md5sums=('9449cbbecde53cb554d9a13313a4dd9a')

_dirname="$pkgname-${_major_version}.${_minor_version}-Source"

source=("https://dtai.cs.kuleuven.be/krr/files/releases/$pkgname/${_major_version}.${_minor_version}/${_dirname}.tar.gz")


build() {
	cmake "$srcdir/$_dirname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release" -DSPASS:BOOL="0"
	#make -j 4
	make
}

check() {
	make check
}

package() {
	make DESTDIR="$pkgdir/" install
}
