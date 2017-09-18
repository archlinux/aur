# Contributor: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-runsql'
pkgver='0.15'
pkgrel='1'
pkgdesc="Perl/CPAN Module DBIx::RunSQL: run SQL from a file"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi' 'perl>=5.006')
optdepends=('perl-dbd-sqlite: SQLite support')
makedepends=()
url='https://metacpan.org/release/DBIx-RunSQL'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CORION/DBIx-RunSQL-0.15.tar.gz')
md5sums=('148c2b3242d60ef6c7eb544be36f996c')
sha512sums=('2fa2a9e5d00cdc55a0761dd1b7a76d3e4c62a0bae90671ba9928f0728ac176b27dd6fae6c8fa4bb58a53be4ce71affff26d53116696d06ca6f4fd2e43aa75233')
_distdir="DBIx-RunSQL-0.15"

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
