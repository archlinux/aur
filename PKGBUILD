# Maintainer: nblock <nblock [/at\] archlinux DOT us
# Contributor: Gustavo Dutra <mechamo@gustavodutra.com>

pkgname=postgresql-autodoc
_pkgname=postgresql_autodoc
_pkgver=bb48612ccafdcb035a9525a0439dc580f977523e
pkgver=1.41
pkgrel=5
pkgdesc="Translate PostgreSQL tables to HTML, Dot, Dia and DocBook XML files."
url="https://github.com/candu/autodoc"
license=("3-clause BSD")
depends=('perl' 'perl-dbi' 'perl-dbd-pg' 'perl-term-readkey' 'perl-html-template')
arch=('any')
source=(${_pkgname}-${_pkgver}.tar.gz::https://github.com/candu/autodoc/archive/${_pkgver}.tar.gz)
md5sums=('4b4b7266b91cfdc709b5845957e3fe1c')

build() {
	cd autodoc-${_pkgver}
	make
}

package() {
	cd autodoc-${_pkgver}
	make install PREFIX=/usr DESTDIR=${pkgdir}
}

# vim:set ts=2 sw=2 noet:
