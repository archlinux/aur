# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-hash-lx'
pkgver='0.0603'
pkgrel='1'
pkgdesc="Convert hash to xml and xml to hash using LibXML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-libxml' 'perl>=5.6.2')
makedepends=('perl-lib-abs>=0.90')
url='https://metacpan.org/release/XML-Hash-LX'
source=('http://search.cpan.org/CPAN/authors/id/M/MO/MONS/XML-Hash-LX-0.0603.tar.gz')
md5sums=('43103ac528427f1cf7212ad5412ade2d')
sha512sums=('d31af10d5ae924c86d439bd38643a84c13d7c1a9085c4f89534644025b18bc1cfbac96d767e8541e2ba7dd702012732ce3bd394bfb10f5248bfab6ccc6f689e3')
_distdir="XML-Hash-LX-0.0603"

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
