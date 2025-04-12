# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-class-schema-loader'
pkgver='0.07053'
pkgrel='1'
pkgdesc="Create a DBIx::Class::Schema based on a database"
arch=('any')
license=('Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-carp-clan' 'perl-class-accessor-grouped>=0.10008' 'perl-class-c3-componentised>=1.0008' 'perl-class-inspector>=1.27' 'perl-class-unload>=0.07' 'perl-dbd-sqlite>=1.29' 'perl-dbix-class>=0.08127' 'perl-data-dump>=1.06' 'perl-hash-merge>=0.12' 'perl-lingua-en-inflect-number>=1.1' 'perl-lingua-en-inflect-phrase>=0.15' 'perl-lingua-en-tagger>=0.23' 'perl-mro-compat>=0.09' 'perl-scope-guard>=0.20' 'perl-string-camelcase>=0.04' 'perl-string-toidentifier-en>=0.05' 'perl-try-tiny' 'perl-curry>=1.000000' 'perl-namespace-clean>=0.23')
makedepends=()
checkdepends=('perl-test-deep>=0.107' 'perl-test-differences>=0.60' 'perl-test-exception>=0.31' 'perl-test-warn>=0.21')
url='https://metacpan.org/release/DBIx-Class-Schema-Loader'
source=("http://search.cpan.org/CPAN/authors/id/V/VE/VEESH/DBIx-Class-Schema-Loader-${pkgver}.tar.gz")
md5sums=('a9222cdd26740228177f0e9479931efd')
sha512sums=('a3d3c638a3fb971bb75b12900c834584d092432cdcd6d6dc0d16efd8715d5985ae142aae59dbea359af52aed6441b52f6308ef9049f85bd7756363d1d213a645')
_distdir="DBIx-Class-Schema-Loader-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
