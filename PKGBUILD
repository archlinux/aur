# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-template-plugin-json-escape'
pkgver='0.02'
pkgrel='1'
pkgdesc="Perl/CPAN Module Template::Plugin::JSON::Escape: Adds a .json vmethod and a json filter."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2.12' 'perl-template-toolkit')
makedepends=()
url='https://metacpan.org/release/Template-Plugin-JSON-Escape'
source=('http://search.cpan.org/CPAN/authors/id/N/NA/NANTO/Template-Plugin-JSON-Escape-0.02.tar.gz')
md5sums=('e80fc7d043dd7df1e1fa2fd59090846a')
sha512sums=('cc1325d6e9ac2bc9cd051cb1e29542b339795de36c269c586a951ca0e06bb3e9690a52dc3a617d83502aa366223bbd0754ecc52df8c2a2a9ba42f1904fa7b34d')
_distdir="Template-Plugin-JSON-Escape-0.02"

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
