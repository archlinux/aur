# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Charles Mauch <cmauch@gmail.com>
# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname=perl-perlio-eol
pkgver=0.14
pkgrel=2
pkgdesc="Perl/CPAN Module PerlIO::eol"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/PerlIO-eol"
license=('GPL' 'PerlArtistic')
replaces=('perlio-eol')
depends=('perl')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/A/AU/AUDREYT/PerlIO-eol-$pkgver.tar.gz")
sha256sums=('423b8006d80c7a4385ce4144cd3949abe1c31ac5ed7deb40dbdbc972400692e7')

build() {
	cd "$srcdir/PerlIO-eol-$pkgver"
	PERL_MM_USE_DEFAULT=1 INSTALLDIRS=vendor perl Makefile.PL
	make
}

package() {
	cd "$srcdir/PerlIO-eol-$pkgver"
	make DESTDIR="$pkgdir" install
}
