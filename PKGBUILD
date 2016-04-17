pkgname='git-evtag'
pkgdesc='Extended verification for Git tags'
pkgver='2016.1'
pkgrel='1'
arch=('x86_64' 'i686')
license=('LGPL')
url='https://github.com/cgwalters/git-evtag'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('3fed18cab7dfdf5e073805f7edbc0a7f56809740b29c1fd3ecaaf09792b711b54722af59b8c105b9e828119f5e84370a05a84be391a5bfe031bb689fa2bfaa6d')
makedepends=('automake' 'autoconf')
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
