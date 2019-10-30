# Contributor: BluePeril "<blueperil@blueperil.de>"
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mce'
pkgver='1.862'
pkgrel='1'
pkgdesc="Many-Core Engine for Perl providing parallel processing capabilities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='https://metacpan.org/release/MCE'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARIOROY/MCE-1.862.tar.gz')
md5sums=('582c69034cccc73aa8179c9c9db9a6b2')
sha512sums=('18f34f6369711a4ec5cbc7f3a4a844bab8ac1b9e38a1ec4bb620c32fb85b49bebc6fef55511c59602bb420566243f1fdbf346327773985ffea27a49bc261a1ae')
_distdir="MCE-1.862"

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
