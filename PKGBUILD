# Contributor: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cgi-session-serialize-yaml'
pkgver='4.26'
pkgrel='1'
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
source=('http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/CGI-Session-Serialize-yaml-4.26.tgz')
md5sums=('29f35caaf1de910c0a99bdc9b2f05264')
sha512sums=('b48850a0566e6c22e2deecbc02ba4d6b4997b7ba657ca8f72ffe958ddc787d5b28a406044edf7785fd3da2bbe5ff94320edd69c175d7009b2049523f49522abb')
_distdir="CGI-Session-Serialize-yaml-4.26"

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
