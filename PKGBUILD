# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=4store
pkgver=1.1.5
pkgrel=1
pkgdesc="Efficient, scalable and stable RDF database"
arch=('i686' 'x86_64')
url="http://www.4store.org"
license=('GPL')
depends=('raptor' 'rasqal' 'glib2' 'libxml2' 'pcre' 'avahi' 'readline' 'ncurses' 'termcap' 'expat' 'zlib')
options=('!emptydirs')
source=("http://4store.org/download/${pkgname}-v${pkgver}.tar.gz")
md5sums=('90512417abc588c6b60d7b2167f7dc39')

prepare()
{
	cd "${srcdir}/${pkgname}-v${pkgver}"

	./configure --prefix=/usr
}

build()
{
	cd "${srcdir}/${pkgname}-v${pkgver}"

	make
}

package()
{
	cd "${srcdir}/${pkgname}-v${pkgver}"
	make DESTDIR="${pkgdir}" install

}
