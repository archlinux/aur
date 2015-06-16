# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-xql'
pkgver='0.68'
pkgrel='1'
pkgdesc="A perl module for querying XML tree structures with XQL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-manip>=5.33' 'perl-libwww' 'perl-parse-yapp' 'perl-xml-dom>=1.29' 'perl-xml-parser>=2.30')
makedepends=()
url='http://search.cpan.org/dist/XML-XQL'
source=('http://search.cpan.org/CPAN/authors/id/T/TJ/TJMATHER/XML-XQL-0.68.tar.gz')
md5sums=('bb84096fdf8bcc96a35971539ce8c19e')
sha512sums=('a946f4544a70ac71e37769972ed7355697694548b5e348f9469b2506375f83c0506c4e5fef0c5a8ff1b1116026d31963a5f673842bce187e4ccc1c2284f1816f')
_distdir="XML-XQL-0.68"

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
