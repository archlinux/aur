# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-scope-upper'
pkgver='0.22'
pkgrel='1'
pkgdesc="Act on upper scopes."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
url='http://search.cpan.org/dist/Scope-Upper'
source=('http://search.cpan.org/CPAN/authors/id/V/VP/VPIT/Scope-Upper-0.22.tar.gz')
md5sums=('ad98b934247be411c1cc15d73844bca4')
sha512sums=('90b4866cbeb2f5149f57ea369e823b9efa89b74922e2195316b999f7db37c9954427a872fedd0b64db3d25b54d02d0b5853354ef79281dc9e6ee981c4424bf66')
_distdir="Scope-Upper-0.22"

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
