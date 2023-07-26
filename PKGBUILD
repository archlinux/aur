pkgname='git-evtag'
pkgdesc='Extended verification for Git tags'
pkgver='2022.1'
pkgrel='1'
arch=('x86_64' 'i686')
license=('LGPL')
url='https://github.com/cgwalters/git-evtag'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('f63d26275f5fa419e7fca882b2eb20b8f50e06eb1db308ea2c0e620eb19fac114748e6aad3ebe7616efff7263cb58fa74deb456f24a6e81ff8ff07109e78b765')
makedepends=('automake' 'autoconf' 'libxslt' 'docbook-xsl')
depends=('git' 'libgit2' 'glib2')

prepare () {
	cd "${pkgname}-${pkgver}"
	NOCONFIGURE=1 ./autogen.sh
}

build () {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
