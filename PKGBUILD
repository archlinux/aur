# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-elemental'
pkgver='2.11'
pkgrel='1'
pkgdesc="simplistic and perlish handling of XML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-task-weaken>=1.02' 'perl-xml-sax')
makedepends=()
url='http://search.cpan.org/dist/XML-Elemental'
source=('http://search.cpan.org/CPAN/authors/id/T/TI/TIMA/XML-Elemental-2.11.tar.gz')
md5sums=('d9dc66d1b24e890e07b28020cf05f4a6')
sha512sums=('d9c1d324aa6c8d5648d9cde9ff801ee04b03e44614c82bf7d0330dfef02c03333c3a05f71cc41e052dfefe921c48c0f200dac477f76203afc93289c71f1aa96a')
_distdir="XML-Elemental-2.11"

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
