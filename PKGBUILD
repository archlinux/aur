# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-format-natural'
pkgver='1.02'
pkgrel='1'
pkgdesc="Create machine readable date/time with natural parsing logic"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-boolean' 'perl-clone' 'perl-datetime' 'perl-datetime-timezone' 'perl-list-moreutils' 'perl-module-util' 'perl-params-validate')
makedepends=('perl-test-mocktime')
url='http://search.cpan.org/dist/DateTime-Format-Natural'
source=('http://search.cpan.org/CPAN/authors/id/S/SC/SCHUBIGER/DateTime-Format-Natural-1.02.tar.gz')
md5sums=('258203626de566250ef245b2b680cacc')
sha512sums=('e291fb862499e3b823bb5ac216413ee8d316bf86d731c94d7204146f14ecb21d474d78bf90d584858e95b52b7f49fa0603da30cb59016ef65678f89f78353130')
_distdir="DateTime-Format-Natural-1.02"

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
