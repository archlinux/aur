# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-z3950-zoom'
pkgver='1.32'
pkgrel='1'
pkgdesc="Perl/CPAN Module Net::Z3950::ZOOM: Perl extension for invoking the ZOOM-C API."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('libxml2>=2.13.4' 'libxslt>=1.1.42' 'perl-marc-record>=1.38' 'yaz>=5.34.0')
makedepends=()
url='https://metacpan.org/release/Net-Z3950-ZOOM'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIRK/Net-Z3950-ZOOM-${pkgver}.tar.gz")
md5sums=('84fd793f6b5b3080e87bf37d44065d05')
sha512sums=('80a635ed4c1dbf35b387c76890eaa9d5312d210d991666f3dfd5522321327d20efe36806234316ebf4ce4911b5f65a3daaab00d39b5c836905903b75c57c6c46')
_distdir="Net-Z3950-ZOOM-${pkgver}"

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
