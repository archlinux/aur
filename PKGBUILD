# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-trine'
pkgver='1.006'
pkgrel='1'
pkgdesc="An RDF Framework for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010' 'perl-algorithm-combinatorics' 'perl-data-uuid' 'perl-dbd-sqlite>=1.14' 'perl-dbi' 'perl-dbix-connector' 'perl-error' 'perl-http-negotiate' 'perl-json>=2' 'perl-libwww' 'perl-log-log4perl' 'perl-moose>=2' 'perl-moosex-arrayref' 'perl-set-scalar' 'perl-text-csv' 'perl-text-table' 'perl-uri>=1.52' 'perl-xml-commonns>=0.04' 'perl-xml-namespace' 'perl-xml-sax>=0.96')
makedepends=('perl-test-exception' 'perl-test-json' 'perl-trycatch')
url='http://search.cpan.org/dist/RDF-Trine'
source=('http://search.cpan.org/CPAN/authors/id/G/GW/GWILLIAMS/RDF-Trine-1.006.tar.gz')
md5sums=('0268d65aa0d3261384619e0348597db2')
sha512sums=('b0be91884c2ec9b8381f021bed0779ee04c50c9274cb8a131051b9305602edc236da547090ac6572162f1d94134205698b67ed9abef31501f048b667a1e9dce6')
_distdir="RDF-Trine-1.006"

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
