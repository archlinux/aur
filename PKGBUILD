# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-xml-tidy'
pkgver='1.12'
pkgrel='1'
pkgdesc="tidy indenting of XML documents"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-math-basecnv>=0' 'perl-xml-xpath>=0')
makedepends=()
checkdepends=('perl-test-pod>=0' 'perl-test-pod-coverage>=0')
url='http://search.cpan.org/dist/XML-Tidy'
source=('http://search.cpan.org/CPAN/authors/id/P/PI/PIP/XML-Tidy-1.12.B55J2qn.tgz')
md5sums=('a6179a289edbd6ae7dd050b98c87f7dc')
sha512sums=('eda74fa413aa40cf0933830f65f00507fa967f825cdb0b45f97bb9c90eeef93bf0eb6d416896557da023bd60c652004530496149a839a8750483f80daa342500')
_distdir="XML-Tidy-1.12.B55J2qn"

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

# FIXME
_check() {
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
