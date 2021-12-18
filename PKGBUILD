# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbd-mock'
pkgver='1.59'
pkgrel='1'
pkgdesc="Perl/CPAN Module DBD::Mock: Mock database driver for testing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=1.3' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-exception>=0.31')
url='https://metacpan.org/release/DBD-Mock'
source=("http://search.cpan.org/CPAN/authors/id/J/JL/JLCOOPER/DBD-Mock-$pkgver.tar.gz")
md5sums=('666716574bf4f6c92b36c6c4344d746b')
sha512sums=('c1ba954ae3f22df9d143e023c1ad5537315618e1d959120af8afdbfc69b13ad3a3ef153a6adbb7f853c204bfc2a3c789daf9de0830260f0687143eb68c31d11f')
_distdir="DBD-Mock-$pkgver"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
