# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-json-validator'
pkgver='1.04'
pkgrel='1'
pkgdesc="Perl/CPAN Module JSON::Validator: Validate data against a JSON schema"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=7.15')
makedepends=()
url='https://metacpan.org/release/JSON-Validator'
source=('http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/JSON-Validator-1.04.tar.gz')
md5sums=('0d7f20163372b33b13cb2807ace0fba9')
sha512sums=('8e53dcefef2212bac52e73ec61650c20bda66de7898a821db4b19f46e88cd031eaa951d04c743a1c0fccc23cce51a29feceb2a0a6c06f8ae5ac8f736837b4e2c')
_distdir="JSON-Validator-1.04"

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
