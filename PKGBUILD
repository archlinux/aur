# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-critic-toomuchcode'
pkgver='0.19'
pkgrel='2'
pkgdesc="perlcritic add-ons that generally check for dead code."
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-ppix-quotelike>=0' 'perl-ppix-utils>=0.002' 'perl-perl-critic>=0')
makedepends=()
url='https://metacpan.org/release/Perl-Critic-TooMuchCode'
source=("http://search.cpan.org/CPAN/authors/id/G/GU/GUGOD/Perl-Critic-TooMuchCode-$pkgver.tar.gz")
md5sums=('fc003b6181f42ed9d4427e2a992d6496')
sha512sums=('9f2dcd52c6bdf5d6aafd1910f9e947baecdbbcbe895022c33422d283be13a4e90482f1df7e36da334e54caa88f72713455842c18d52bdd81f51be6fa2482a40d')
_distdir="Perl-Critic-TooMuchCode-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
   /usr/bin/perl Build.PL
   /usr/bin/perl Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  /usr/bin/perl Build test
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
