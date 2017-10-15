# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-class-schema-populatemore'
pkgver='0.19'
pkgrel='1'
pkgdesc="Perl/CPAN Module DBIx::Class::Schema::PopulateMore: An enhanced populate method"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetimex-easy>=0.089' 'perl-list-moreutils>=0.30' 'perl-module-pluggable>=3.9' 'perl-moo>=1.004006' 'perl-moox-handlesvia>=0.001005' 'perl-type-tiny>=0.042' 'perl>=5.8.5')
makedepends=('perl-dbix-class>=0.08127' 'perl-datetime-format-sqlite>=0.11' 'perl-path-class>=0.23' 'perl-sql-translator>=0.11020' 'perl-yaml-tiny>=1.48')
url='https://metacpan.org/release/DBIx-Class-Schema-PopulateMore'
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/DBIx-Class-Schema-PopulateMore-$pkgver.tar.gz")
md5sums=('dbaec016f923da3f5361072df6364a58')
sha512sums=('d0c57223853477e87b08ccf5d0f4d42563c56cf171598fcebf4a99acbd0c30312740b8028019e78f79f8dd3ebd419c8a92369f2d18fce8e5cd13287051696de1')
_distdir="DBIx-Class-Schema-PopulateMore-$pkgver"

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
