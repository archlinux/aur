# CPAN Name  : DBM::Deep
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-dbm-deep
pkgver=2.0009
pkgrel=1
pkgdesc='A pure Perl multi-level hash/array DBM that supports transactions'
arch=('any')
url='http://search.cpan.org/dist/DBM-Deep'
license=('PerlArtistic' 'GPL')
depends=('perl')
cheackdepends=('perl-test-deep' 'perl-test-warn' 'perl-test-exception')
source=(http://search.cpan.org/CPAN/authors/id/R/RK/RKINYON/DBM-Deep-2.0009.tar.gz https://rt.cpan.org/Ticket/Attachment/1216944/642637/pod.patch)
options=(!emptydirs)
md5sums=('a5e0aa1d5e835aa1d502e7256b4fb035' '33b420e4e89741a42dc18c6337274d69')

build() {
	cd "$srcdir/DBM-Deep-2.0009"
	patch -i "$srcdir/pod.patch" -p1
	PERL_MM_USE_DEFAULT=1 perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd "$srcdir/DBM-Deep-2.0009"
	perl Build test
}

package() {
	cd "$srcdir/DBM-Deep-2.0009"
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
