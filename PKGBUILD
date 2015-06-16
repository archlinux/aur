# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-emoticon-msn'
pkgver='0.04'
pkgrel='1'
pkgdesc="Emoticon filter of MSN Messenger"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-emoticon>=0.02')
makedepends=()
url='http://search.cpan.org/dist/Text-Emoticon-MSN'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Text-Emoticon-MSN-0.04.tar.gz')
md5sums=('726998dec4de488edbe4710980160c37')
sha512sums=('42c706fd8cc9f7821da9293d5e547c6a3bd625f2bbe3428f6ac83206458e441d0194fae24bf1e20f3a77f35ae0b825fdf4295a500ad32da3edd47bc9472d97df')
_distdir="Text-Emoticon-MSN-0.04"

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
