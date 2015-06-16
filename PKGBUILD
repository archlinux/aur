# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-todocbook'
pkgver='0.03'
pkgrel='2'
pkgdesc="Converts an XHTML file into DocBook."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-getopt-argvfile>=1.09' 'perl-html-simpleparse' 'perl-xml-libxml' 'perl-xml-libxslt')
makedepends=()
url='http://search.cpan.org/dist/html2dbk'
source=('http://search.cpan.org/CPAN/authors/id/R/RU/RUBYKAT/html2dbk-0.03.tar.gz')
md5sums=('757e2a57afa7768e1a8f2db27a468f86')
sha512sums=('ac3b2f610d2968da3fbe0cd4d00d5e8405da70aaca6b47a4c74f6d0311d53b1ca7fc2925dfb3b9ac959f52459e0b7e33ecf4b624f22054e1fce93f89891d2f91')
_distdir="html2dbk-0.03"

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
