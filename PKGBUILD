# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-tempdir'
pkgver='0.10'
pkgrel='1'
pkgdesc="(DEPRECATED) Temporary files support for testing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-nfslock' 'perl-moose' 'perl-moosex-types-path-class' 'perl-path-class' 'perl-sub-exporter' 'perl-test-requires' 'perl-namespace-autoclean>=0.08' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-TempDir'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-TempDir-0.10.tar.gz')
md5sums=('0042d43cbefe61a40a8701eb7ae3ca5d')
sha512sums=('89611be65e201cf83229fe6ca3ab3af5c716ceffc699a56ca804901edbfce2ad671f43c9afc84d9affb34345852213ed551b24d5a2fd054278e9c7bc5fb7a820')
_distdir="Test-TempDir-0.10"

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
