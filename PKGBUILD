# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-test-minimumversion'
pkgver='0.101081'
pkgrel='1'
pkgdesc="does your code require newer perl than you think?"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule' 'perl-file-find-rule-perl' 'perl-perl-minimumversion>=1.32' 'perl-test-tester')
makedepends=()
url='http://search.mcpan.org/dist/Test-MinimumVersion'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Test-MinimumVersion-0.101081.tar.gz')
md5sums=('9971f68a4fdfc4a5445018b0d2e3e452')
sha512sums=('9af5821e8d6e4d6471464bf52d60c7f04b87c864b06d92b26f1b9e3ac262fb9d4650a784b8c25a6318b999977f8ed7e32c2716e544763ac65400d1e44e42894d')
_distdir="Test-MinimumVersion-0.101081"

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
