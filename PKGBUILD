# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lexical-sealrequirehints'
pkgver='0.012'
pkgrel='1'
pkgdesc="prevent leakage of lexical hints"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Lexical-SealRequireHints'
source=("http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Lexical-SealRequireHints-${pkgver}.tar.gz")
md5sums=('2203e82b75fa7597d0a2b986c8231b0f')
sha512sums=('14326aeb9ee6ff0bf60d155709758f24cb8626b7848273ebbc4a58ee587091e9ad302b2f380dff90e5a9bf8801d6823f7f93be1761909ed8778fd2871311e728')
_distdir="Lexical-SealRequireHints-${pkgver}"

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
