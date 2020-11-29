# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-visitor'
pkgver='0.31'
pkgrel='1'
pkgdesc="Perl/CPAN Module Data::Visitor: Visitor style traversal of Perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.89' 'perl-sub-name' 'perl-tie-toobject>=0.01' 'perl-namespace-clean>=0.19' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-needs')
url='https://metacpan.org/release/Data-Visitor'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Data-Visitor-$pkgver.tar.gz")
md5sums=('87f35b109f78177c59fab6de1039b8da')
sha512sums=('4c2cba80e3ef5ed0a19836b58f82da18e8ea1adf25c60767f308807c0e592bc679df6e4d58a0b1fd9fc65d558403d4beab1c327914c4572902971857cbdb8198')
_distdir="Data-Visitor-$pkgver"

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
