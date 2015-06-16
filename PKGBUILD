# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-config-crontab'
pkgver='1.33'
pkgrel='1'
pkgdesc="Read/Write Vixie compatible crontab(5) files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Config-Crontab'
source=('http://search.cpan.org/CPAN/authors/id/S/SC/SCOTTW/Config-Crontab-1.33.tar.gz')
md5sums=('d53d47477a7d044b0cf6d54e21aa0215')
sha512sums=('2545449a30cf575c89bb8e45d199a98042f5cb3bb91117ddb3d8f9c9d1b6e609fde96eca06d3866c3f12a3d438b093df34a7e87a68056bd05c58892dfcf2927a')
_distdir="Config-Crontab-1.33"

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
