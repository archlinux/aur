# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-multimethods'
pkgver='1.70'
pkgrel='1'
pkgdesc="Support multimethods and function overloading in Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Class-Multimethods'
source=("https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/Class-Multimethods-$pkgver.tar.gz")
md5sums=('5fdc79daa81b102b956b1a61531fd6a7')
sha512sums=('41a6e40e7cebd1f4273a8d410dda0a7fda1d235ed86902a18505274c7b7d9170921a02b5a4328c0a0cb0820455a3376b8e78f453b38af13f184c2f8908253b44')
_distdir="Class-Multimethods-$pkgver"

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
