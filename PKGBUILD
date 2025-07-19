# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-tokeparser-simple'
pkgver='3.16'
pkgrel='4'
pkgdesc="Easy to use HTML::TokeParser interface"
arch=('any')
license=('Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl-html-parser>=3.25' 'perl-sub-override>=0')
makedepends=()
checkdepends=('perl-test-pod'
              'perl-test-pod-coverage')
url='https://metacpan.org/release/HTML-TokeParser-Simple'
source=('https://search.cpan.org/CPAN/authors/id/O/OV/OVID/HTML-TokeParser-Simple-3.16.tar.gz')
sha512sums=('d13487cc86af7c7e90aa5b9006b989faedd6a8e06279aaf6a0f13bad613a1672b3fa280bf8f369236033104d3c092e62efa177595cc5e5c74cb966e0b12a205a')
_distdir="HTML-TokeParser-Simple-3.16"

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
    make test TEST_FILES=xt/*.t
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
