# CPAN Name  : Test::Script::Run
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-test-script-run
pkgver=0.08
pkgrel=2
pkgdesc='Perl module helping with scripts testing in your module'
arch=('any')
url='https://metacpan.org/release/Test-Script-Run'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-ipc-run3' 'perl-test-exception')
optdepends=('perl-string-shellquote: quote arguments in test names')
source=(http://search.cpan.org/CPAN/authors/id/S/SU/SUNNAVY/Test-Script-Run-0.08.tar.gz)
options=(!emptydirs)
md5sums=('a218158ca0ba364b4ed43cc04f0fc8e5')

build() {
	cd Test-Script-Run-0.08
	PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Test-Script-Run-0.08
	make test
}

package() {
	cd Test-Script-Run-0.08
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
