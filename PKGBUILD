# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-brownie'
pkgver='0.09'
pkgrel='1'
pkgdesc="Browser integration framework inspired by Capybara"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load' 'perl-file-slurp' 'perl-html-selector-xpath' 'perl-html-treebuilder-xpath' 'perl-plack' 'perl-selenium-remote-driver' 'perl-selenium-server' 'perl-sub-install' 'perl-test-tcp' 'perl-uri' 'perl-www-mechanize' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-exception' 'perl-test-fake-httpd>=0.03' 'perl-test-mock-guard' 'perl-test-useallmodules')
url='https://metacpan.org/release/Brownie'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MASAKI/Brownie-0.09.tar.gz')
md5sums=('b7c0e2c26bf435108f24833a7bcebd1d')
sha512sums=('f37ee147854220a4af8fbca43680d02fe4788869ba2209588f1694ca20b0999e0afebd74b8e7d0ebb1c86e3809ae5bfa83f57d249a4292ef3f277c2b3f5d6999')
_distdir="Brownie-0.09"

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
