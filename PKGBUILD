# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rest-google'
pkgver='1.0.8'
pkgrel='1'
pkgdesc="access Google REST (aka AJAX) API from Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1' 'perl-class-accessor>=0.31' 'perl-class-data-inheritable>=0.06' 'perl-json-any>=1.16' 'perl-libwww' 'perl-uri>=1.35')
makedepends=()
url='http://search.cpan.org/dist/REST-Google'
source=('http://search.cpan.org/CPAN/authors/id/E/EJ/EJS/REST-Google-1.0.8.tar.gz')
md5sums=('e4b07546dd6858c772c0820a5edf1d54')
sha512sums=('ba321c1fce8117dbccd83b41da6890e21dc90a8c29398832dc6dd502e7033713f3c730134f6b7c67f1f853b29fafbcaa9ddbd76b138b02752e0c939059ecaa82')
_distdir="REST-Google-1.0.8"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
