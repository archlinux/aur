# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Contributor: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mce'
pkgver='1.901'
pkgrel='1'
pkgdesc="Many-Core Engine for Perl providing parallel processing capabilities"
arch=('any')
license=('Artistic-1.0-Perl'
         'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/MCE'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MARIOROY/MCE-${pkgver}.tar.gz")
md5sums=('0ff7a772d688f26df08b8e1b7c6a1133')
sha512sums=('510a3f76ada26eb4b04d72e195ddcfac75d8948a2e74ede6fe3de00d1d799f08563ac22c44c38e2a82ec438c3ee110f94386298d1db0305ce6ad801e40f6e667')
_distdir="MCE-${pkgver}"

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
