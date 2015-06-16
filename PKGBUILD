# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lwp-online'
pkgver='1.08'
pkgrel='1'
pkgdesc="Does your process have access to the web"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.005' 'perl-libwww' 'perl-uri>=1.35')
makedepends=()
url='http://search.cpan.org/dist/LWP-Online'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/LWP-Online-1.08.tar.gz')
md5sums=('20e25b3af8b84a493c730249c2a9c50d')
sha512sums=('2b255f60ee6521757ce3d49cc0720e3985ff17e3db7b7868ced6a9e1c5444dc067c80b7d34dbe7be9679c134f3de1dbe0e9421a1a20ff388c812aacd1d964497')
_distdir="LWP-Online-1.08"

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
