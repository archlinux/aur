# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-indirect'
pkgver='0.37'
pkgrel='1'
pkgdesc="Perl/CPAN Module indirect: Lexically warn about using the indirect method call syntax."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/indirect'
source=("http://search.cpan.org/CPAN/authors/id/V/VP/VPIT/indirect-$pkgver.tar.gz")
md5sums=('d6ae968af42ab90e03f70a2f93ac6b51')
sha512sums=('8d46ff62c86b23519b030474155f7d8aa4872a9a4a2bb1e3199ac506aee60343b4c572eae8fa41dc5148c115de3c80bcb7f21900ad30822dc9eb437033defe09')
_distdir="indirect-$pkgver"

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
