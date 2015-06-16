# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-cgi-ex'
pkgver='2.42'
pkgrel='1'
pkgdesc="CGI utility suite - makes powerful application writing fun and easy"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-template-alloy>=1.016')
makedepends=()
url='http://search.mcpan.org/dist/CGI-Ex'
source=('http://search.mcpan.org/CPAN/authors/id/L/LJ/LJEPSON/CGI-Ex-2.42.tar.gz')
md5sums=('179f4f70747c955485c13cf1a39f586d')
sha512sums=('787077760a3a49afda7ea8b7c0382e93451cbecc8598607a9f8d7b433e480ff172467695678168999a8d1098019382eb2bfad800a3af75604cb8a6f0420d481a')
_distdir="CGI-Ex-2.42"

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
