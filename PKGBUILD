# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cgi-application'
pkgver='4.50'
pkgrel='1'
pkgdesc="Framework for building reusable web-applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi' 'perl-class-isa' 'perl-html-template')
makedepends=()
url='https://metacpan.org/release/CGI-Application'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARKSTOS/CGI-Application-4.50.tar.gz')
md5sums=('356595b6f12373f57243a7e605b9cd43')
sha512sums=('c23a965c195709dba720a441093afa0f94a66dfd0bc4bfda6fdce01a2839c78ac58d1046200f7c3ea4845471932c3d9170fd25dff80226a17db9eda4cc529f20')
_distdir="CGI-Application-4.50"

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
