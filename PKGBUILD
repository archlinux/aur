# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojox-renderer-xslate'
pkgver='0.14'
pkgrel='1'
pkgdesc="Text::Xslate renderer for Mojo"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl-mojolicious>=5.81' 'perl-text-xslate>=0.2013' 'perl-try-tiny')
makedepends=('perl-mojolicious')
url='https://metacpan.org/release/MojoX-Renderer-Xslate'
source=('https://search.cpan.org/CPAN/authors/id/H/HJ/HJANSEN/MojoX-Renderer-Xslate-0.14.tar.gz')
md5sums=('7e40bf4b0d88df9b1b842b60e95cea0c')
sha512sums=('a89c02f51f296e077a9d1b9c2d1d79445f934ab4fdb0497f49d5f2a485c852f1cba8b94eaf60b2714f3250f45808b68231f4619aa22f0535cb9d951ff89da771')
b2sums=('4631bc9e611884ee824ac148a8b16e911358837dc8d9dba59180b4eaf966465ae1d6ad177077b0c6bbac18ce43a5666182a67f53a45ec740976c4d985498e3b7')
_distdir="MojoX-Renderer-Xslate-0.14"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
