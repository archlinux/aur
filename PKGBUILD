# Contributor: BluePeril "<blueperil@blueperil.de>"
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mce'
pkgver='1.863'
pkgrel='1'
pkgdesc="Many-Core Engine for Perl providing parallel processing capabilities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='https://metacpan.org/release/MCE'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARIOROY/MCE-1.863.tar.gz')
md5sums=('aa1cd311d344fac4ab7d2bb1abba4b90')
sha512sums=('dde8d08fb6ea0ca79ba03bd53ef40d9d7872b8cde73b9fe1fdf6920d663119b0c3a7c7a225094ff239816ecab51de3bd986e1ac0ef41ed8939b726b9175484d1')
_distdir="MCE-1.863"

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
