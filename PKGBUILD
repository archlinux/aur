# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-amf-perl'
pkgver='0.15'
pkgrel='1'
pkgdesc="Flash Remoting in Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=0.01' 'perl-exception-class>=0.01')
makedepends=()
url='https://metacpan.org/release/AMF-Perl'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SIMONF/AMF-Perl-0.15.tar.gz')
md5sums=('653fd3f7c9d67c6ef7d78cea0545be8c')
sha512sums=('a12bbc0415b2f2adf64a61ec5642fce0e8abd0c42206502e48820909c7d3a784be833a43b78a31cb5c0c5bd7d79df587e9d0e49499f40d9cce2c8e8371d8fc5e')
_distdir="AMF-Perl-0.15"

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
