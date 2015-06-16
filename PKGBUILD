# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-inet6glue'
pkgver='0.6'
pkgrel='1'
pkgdesc="Make common modules IPv6 ready by hotpatching"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-inet6>=2.54')
makedepends=()
url='http://search.cpan.org/dist/Net-INET6Glue'
source=('http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/Net-INET6Glue-0.6.tar.gz')
md5sums=('bbcb7724b64b7f3156b6cd249a014e25')
sha512sums=('79fc5eb9bb31ef331b920bf33eb58d5e083de5c70881409d0d18d40f67153c43b40bbb038a5d643c3637bcb390e477716ebe716134cae6e6619c1da64d8e661a')
_distdir="Net-INET6Glue-0.6"

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
