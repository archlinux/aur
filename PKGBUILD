# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-critic-strictersubs'
pkgver='0.07'
pkgrel='1'
pkgdesc="Perl::Critic plugin for stricter subroutine checks"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-pathlist>=0' 'perl-list-moreutils>=0' 'perl-module-build>=0.4' 'perl-ppi>=0' 'perl-perl-critic>=0')
makedepends=()
url='https://metacpan.org/release/Perl-Critic-StricterSubs'
source=("https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/Perl-Critic-StricterSubs-$pkgver.tar.gz")
md5sums=('72600b5f0d839e3335823070a8eba7f6')
sha512sums=('03f97f077c19744ab4acff949642beecf72b3574f2e4886363377c7564e8627644c922d2b529c47f1a7ea4b121257b6f9900b9f10d0ed7fcb8636677c2619b85')
_distdir="Perl-Critic-StricterSubs-$pkgver"

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
