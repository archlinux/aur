# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Devin Mullins <me@twifkak.com>

pkgname="tagsistant"
pkgver="0.8.1a"
pkgrel="1"
pkgdesc="A semantic File System based on Fuse for Linux kernel"
url="http://www.tagsistant.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('fuse' 'libdbi' 'libdbi-drivers' 'sqlite2' 'sqlite' 'libmariadbclient' 'postgresql-libs' 'glib2' 'libextractor')
conflicts=('tagsistant-svn')
install="tagsistant.install"
changelog="ChangeLog"
source=("${pkgname}.tar.gz::http://www.tagsistant.net/download/${pkgname}-0-8-1a-tar-gz/finish/11-${pkgname}-0-8-1a/31-${pkgname}-0-8-1a/0")
sha1sums=('fd689f29f8d44158bd03aee86bf8d74bc0f4947c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    autoreconf -vfi
    ./configure --prefix=/usr --datarootdir="${pkgdir}/usr/share"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    make DESTDIR="$pkgdir/" install
}

# vim:set ts=4 sw=4 et:
