# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-plack-middleware-debug'
pkgver='0.14'
pkgrel='1'
pkgdesc="display information about the current request/response"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-class-method-modifiers>=1.05' 'perl-data-dump' 'perl-file-sharedir>=1.00' 'perl-plack' 'perl-text-microtemplate>=0.15')
makedepends=()
url='http://search.cpan.org/dist/Plack-Middleware-Debug'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-Middleware-Debug-0.14.tar.gz')
md5sums=('55b4d11e38299002cf68b6b0fd91631e')
sha512sums=('d176656dc1aa2cfad0ecbe5b9d9ee667c8ab606ef670c1a67788109bd24d57e8bf8bb03b1c333c2460e053e2a3d04abfeabc3a82970093ef40ed7b73d0a9c17d')
_distdir="Plack-Middleware-Debug-0.14"

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
