# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-catalyst-controller-dbic-api'
pkgver='2.005001'
pkgrel='1'
pkgdesc="Provides a DBIx::Class web service automagically"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi-expand>=2.02' 'perl-catalyst-action-rest>=0' 'perl-catalyst-model-dbic-schema>=0.20' 'perl-catalyst-runtime>=5.90020' 'perl-dbix-class>=0.08103' 'perl-data-dpath-validator>=0.093411' 'perl-json>=2.50' 'perl-moosex-types-structured>=0.20')
makedepends=()
checkdepends=('perl-test-deep>=0.104' 'perl-test-www-mechanize-catalyst>=0.37')
url='http://search.cpan.org/dist/Catalyst-Controller-DBIC-API'
source=('http://search.cpan.org/CPAN/authors/id/A/AB/ABRAXXA/Catalyst-Controller-DBIC-API-2.005001.tar.gz')
md5sums=('87902434404320e1c87c3ef81430f3c2')
sha512sums=('def4ed644b783aab2d389a42464a9b678d528fa8b319c3d7f3fcfd6492e2f84f0820774a2edb89eaf6d9cdb9462a0ef03e2a22df3ae9a4a26ca32c32a4c5a468')
_distdir="Catalyst-Controller-DBIC-API-2.005001"

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
