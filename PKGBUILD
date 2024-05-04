# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cgi-session-serialize-yaml'
pkgver='4.26_001'
pkgrel='3'
pkgdesc="Perl/CPAN Module CGI::Session::Serialize::yaml: Add YAML and YAML::Syck support to CGI::Session's serializers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
optdepends=('perl-yaml: YAML support'
            'perl-yaml-syck: YAML::Syck support')
depends=('perl-cgi-session>=4.3')
makedepends=('perl-module-build>=0.36')
checkdepends=('perl-test-pod')
url='https://metacpan.org/release/CGI-Session-Serialize-yaml'
source=("https://cpan.metacpan.org/authors/id/T/TI/TINITA/CGI-Session-Serialize-yaml-$pkgver.tar.gz")
md5sums=('7e012d6781d1c15569c295aedd71657b')
sha512sums=('d6615819f35fc9b6dde872060872ed69c5ea0964efd64f80718ad5c5f1b029faa8da3719ae938dcc26f1e28dcf7da3bb8c150a9f89567b728d67ef933519e824')
_distdir="CGI-Session-Serialize-yaml-$pkgver"

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
