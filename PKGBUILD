# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-hash-moreutils'
pkgver='0.05'
pkgrel='1'
pkgdesc="Provide the stuff missing in Hash::Util"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Hash-MoreUtils'
source=('http://search.mcpan.org/CPAN/authors/id/R/RE/REHSACK/Hash-MoreUtils-0.05.tar.gz')
md5sums=('3ad192bffc593aa0048c65be04435a33')
sha512sums=('7e53dfda0336198b5981be772a0aeb3aa1fdbfa5885bf866032bcd168a73ceb03f92db6de92874d5812f062ab9c03e1fed27732f60a7004944da568c3cb04845')
_distdir="Hash-MoreUtils-0.05"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
