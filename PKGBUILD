# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-xslate'
pkgver='3.5.9'
pkgrel='1'
pkgdesc="Scalable template engine for Perl5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-messagepack>=0.38' 'perl-mouse>=2.4.5' 'perl>=5.8.1')
makedepends=('perl-file-copy-recursive')
checkdepends=('perl-test-requires')
url='https://metacpan.org/release/Text-Xslate'
source=('http://search.cpan.org/CPAN/authors/id/S/SY/SYOHEX/Text-Xslate-3.3.9.tar.gz')
md5sums=('4fc78a4cc4558cd7c73ae63f9f79ca9c')
sha512sums=('5463fd0c2e5ce00d8ebf438863a5ed8f937da6084491bfade9fd175beb9fc2f9abb0c26c889211ddc7c007b45cd50d82cd873ac1c4d6e92cc97b9f430270dd84')
_distdir="Text-Xslate-3.3.9"

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
