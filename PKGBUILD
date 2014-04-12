# CPAN Name  : Jifty::DBI
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-jifty-dbi
pkgver=0.77
pkgrel=1
pkgdesc='An object-relational persistence framework for Jifty'
arch=('any')
url='http://search.cpan.org/dist/Jifty-DBI'
license=('GPL' 'PerlArtistic')

depends=(
	'perl' # provides 'perl-encode' 'perl-version'
	'perl-cache-simple-timedexpiry>=0.21'
	'perl-class-accessor'
	'perl-class-data-inheritable'
	'perl-class-returnvalue>=0.4'
	'perl-class-trigger>=0.12'
	'perl-clone'
	'perl-dbi'
	'perl-dbix-dbschema>=0.34'
	'perl-data-page>=2.0'
	'perl-datetime>=0.34'
	'perl-datetime-format-iso8601'
	'perl-datetime-format-strptime'
	'perl-exporter-lite'
	'perl-hash-merge'
	'perl-lingua-en-inflect'
	'perl-object-declare>=0.22'
	'perl-scalar-defer>=0.1'
	'perl-universal-require>=0.11')

checkdepends=('perl-test-warn' 'perl-dbd-sqlite')

optdepends=(
	'perl-cache-memcached: Memcached support'
	'perl-yaml: YAML filter'
	'perl-yaml-syck: YAML filter'
	'perl-time-duration: duration filter'
	'perl-time-duration-parse>=0.06: duration filter'
	'perl-uri: URI filter')

options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/Jifty-DBI-0.77.tar.gz)
md5sums=('26c329a4c8fd85e33a2faf2c549ec64e')

build() {
	cd Jifty-DBI-0.77
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL --skipdeps INSTALLDIRS=vendor
	make
}

check() {
	cd Jifty-DBI-0.77
	make test
}

package() {
	cd Jifty-DBI-0.77
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
