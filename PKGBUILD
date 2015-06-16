# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-server-ss-prefork'
pkgver='0.05'
pkgrel='1'
pkgdesc="a hot-deployable variant of Net::Server::PreFork"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-server' 'perl-server-starter>=0.02')
makedepends=('perl-http-server-simple' 'perl-libwww' 'perl-test-tcp>=0.06')
url='http://search.cpan.org/dist/Net-Server-SS-PreFork'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/Net-Server-SS-PreFork-0.05.tar.gz')
md5sums=('4198d48d27353f60cc297178f86c216f')
sha512sums=('895d8dda97455b5ceb32e9f83a8792475b1249115a4df97d2178d513c48ba08576ea41453724da6ea37d5fd2afaa962cf18bf3a8db899202e196ef3e240af497')
_distdir="Net-Server-SS-PreFork-0.05"

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
