# Contributor: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-z3950-zoom'
pkgver='1.30'
pkgrel='1'
pkgdesc="Perl/CPAN Module Net::Z3950::ZOOM: Perl extension for invoking the ZOOM-C API."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.25' 'libgcrypt>=1.7.6' 'libgpg-error>=1.27' 'libxml2>=2.9.4+16+g07418011' 'libxslt>=1.1.29+42+gac341cbd' 'perl-marc-record>=1.38' 'xz>=5.2.3' 'yaz>=5.21.1' 'zlib>=1:1.2.11')
makedepends=()
url='https://metacpan.org/release/Net-Z3950-ZOOM'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIRK/Net-Z3950-ZOOM-1.30.tar.gz')
md5sums=('eb1e6a880b9cb09ac44df97a914dba59')
sha512sums=('6511786d9d25070eb370313428b25e32120b4d591e1dbe585933b57e210423ea5b599bfdd995e65682a0963854b0ad7143c80d90b81f1e511c3ed23e44b6a7cc')
_distdir="Net-Z3950-ZOOM-1.30"

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
