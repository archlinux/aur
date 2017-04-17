# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-find-rule-perl'
pkgver='1.15'
pkgrel='1'
pkgdesc="Common rules for searching for Perl things"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule>=0.20' 'perl-params-util>=0.38' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/File-Find-Rule-Perl'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/File-Find-Rule-Perl-1.15.tar.gz')
md5sums=('d8b458792b7eed83c744ae30b1bc3348')
sha512sums=('90fc64991fbdb47bcb712f2bf7c85b2571a2b161952574606ddfd9c9ad9aeaaa2e0f3355b9c8b993ab2479d8c80e89075caa9e5413259c2bb99b1e75ef791670')
_distdir="File-Find-Rule-Perl-1.15"

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
