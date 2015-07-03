# $Id: PKGBUILD 18639 2010-06-10 11:06:23Z ibiru $
# Maintainer: Biru Ionut <biru.ionut at gmail.com>
pkgname=microblog-purple2
pkgver=0.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Libpurple plug-in supporting microblog services like Twitter. Unofficial version.'
url='https://code.google.com/p/microblog-purple/issues/detail?id=269'
license=('GPL3')
depends=('pidgin' 'json-glib')
conflicts=('microblog-purple')
source=(https://github.com/fr0nk/microblog-purple2/archive/microblog-purple2-$pkgver.tar.gz
	)
sha512sums=('dba47665e883643e8f8ad5a22c8a973ff6ceb0d625e5a98836ac441ca49c0b9c36ada4aa3308634ac658954538cfd14986801923e1b81842c2c3a8056e025f06'
	)

build(){
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}
