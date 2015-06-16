# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-www-mechanize-formfiller'
pkgver='0.11'
pkgrel='1'
pkgdesc="framework to automate HTML forms"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-random>=0.05' 'perl-html-form>=0')
makedepends=()
url='http://search.cpan.org/dist/WWW-Mechanize-FormFiller'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CORION/WWW-Mechanize-FormFiller-0.11.tar.gz')
md5sums=('4604ef3cefa9fefaddbfc8c8787a7ed9')
sha512sums=('60436af00f910465f5bfe60c55200c4a4301380295cf0ac39979a73c7f8efc78559ffd828fb145970838919beb2f4a99bbf134adb1976f577569a13f1c8e3b02')
_distdir="WWW-Mechanize-FormFiller-0.11"

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
