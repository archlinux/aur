# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-je'
pkgver='0.066'
pkgrel='1'
pkgdesc="Pure-Perl ECMAScript (JavaScript) Engine"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-timedate')
makedepends=()
url='https://metacpan.org/release/JE'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/JE-0.066.tar.gz')
md5sums=('63ed03bd82fbae5021a7f3f200c18799')
sha512sums=('e3352df8d1f0afd458866f7cee86da3397a9da3b9e6f59d44f5b50fb30dfd926e9e7e2e4fa4bfacdf9b6b86b7c3260443ab6ebabb971a7b4158d149c9b2c7a30')
_distdir="JE-0.066"

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
