# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-json-validator'
pkgver='4.01'
pkgrel='1'
pkgdesc="Perl/CPAN Module JSON::Validator: Validate data against a JSON schema"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'perl-mojolicious>=7.28' 'perl-yaml-libyaml')
makedepends=()
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/JSON-Validator'
source=("http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/JSON-Validator-$pkgver.tar.gz")
md5sums=('472f26279d84bf2a5d3ab796585a67fe')
sha512sums=('270d17e5f77300c2107a453d0939cbaf536b18f14210661fadf08df957d67d4a4d7bc3d3cb4d6b0b26495cd89258d9d0b7e07929194270b0eca3c75c96593e62')
_distdir="JSON-Validator-$pkgver"

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
