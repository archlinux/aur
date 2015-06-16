# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-rtorrent'
pkgver='0.11'
pkgrel='1'
pkgdesc="Perl interface to rtorrent via XML-RPC."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-collection>=0.43' 'perl-rpc-xml>=0.63')
makedepends=()
url='http://search.cpan.org/dist/Net-RTorrent'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZA/ZAG/Net-RTorrent-0.11.tar.gz')
md5sums=('57194d076c6ce54f9d544e9b94e9353c')
sha512sums=('9668ce84d61f5e801ea14591c352c768007305ca81d0bd4dd35bc3db6426f4924e34983a6c6bed7a1206896dcabcae7a15192372ec751c979196542b21f2135c')
_distdir="Net-RTorrent-0.11"

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
