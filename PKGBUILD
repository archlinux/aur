# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=dovecot-fts-xapian
_reponame=fts-xapian
pkgver=1.4.2
pkgrel=1
epoch=1
pkgdesc="Dovecot FTS plugin based on Xapian"
arch=(x86_64)
url="https://github.com/grosjo/fts-xapian"
license=(LGPL)
depends=(dovecot xapian-core icu)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grosjo/${_reponame}/archive/${pkgver}.tar.gz")

sha256sums=('11ff20bd91d81754bbe4f9ad52cf1fd74be8c3bb8633a7023a35cf4cc3c18c58')

build() {
	cd "${_reponame}-${pkgver}"

	autoreconf -vi
	./configure \
		--prefix=/usr \
		--with-dovecot=/usr/lib/dovecot

	make
}

package() {
	cd "${_reponame}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
