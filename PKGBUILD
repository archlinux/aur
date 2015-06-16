# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-swf-file'
pkgver='0.42'
pkgrel='1'
pkgdesc="Create SWF file."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-temporarybag>=0.08')
makedepends=()
url='https://metacpan.org/release/SWF-File'
source=('http://search.cpan.org/CPAN/authors/id/Y/YS/YSAS/SWF-File-0.42.tar.gz')
md5sums=('7319b35179edd24958fe1a92be8b3a0b')
sha512sums=('3b4df24486654e86f885c7e81a97076e778a5e1a5afb9d6f37ecad4d22784b6e7d5cedc08b8e29dbdae4533e0c630c76a9ae5a43ced3f146e0ac392a4c68fa40')
_distdir="SWF-File-0.42"

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
