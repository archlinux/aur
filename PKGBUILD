# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sru'
pkgver='1.01'
pkgrel='1'
pkgdesc="Search and Retrieval by URL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cql-parser>=1.12' 'perl-class-accessor' 'perl-uri' 'perl-xml-libxml' 'perl-xml-simple' 'perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception')
url='https://metacpan.org/release/SRU'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/SRU-1.01.tar.gz')
md5sums=('9b6f97497cf08d6b949ad9000f0174e5')
sha512sums=('07d5263901f732f9c60fa26f836f6f1c9dcd461947ea10697c73ff16499d1270592530bf95b4cd89811420472ab0b9cfd1c0214d26577830193dbe9017ae42cb')
_distdir="SRU-1.01"

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
