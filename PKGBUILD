# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-runsql'
pkgver='0.21'
pkgrel='1'
pkgdesc="Perl/CPAN Module DBIx::RunSQL: run SQL from a file"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi' 'perl>=5.006')
optdepends=('perl-dbd-sqlite: SQLite support')
makedepends=()
url='https://metacpan.org/release/DBIx-RunSQL'
source=("http://search.cpan.org/CPAN/authors/id/C/CO/CORION/DBIx-RunSQL-$pkgver.tar.gz")
md5sums=('39debe543db19b1e00a5ca3c5817f44b')
sha512sums=('a9b57f2a1f6a0f7f0d58c6dfe218979a4ee50a87cbc827821db835393a4abeb411802842c9259896bfa782c3bb32243a22c887560eae4baf39e353691aad303f')
_distdir="DBIx-RunSQL-$pkgver"

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
