# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-marc-record'
pkgver='2.0.6'
pkgrel='1'
pkgdesc="Perl/CPAN Module MARC::Record: Perl extension for handling MARC records"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/MARC-Record'
source=('http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-Record-2.0.6.tar.gz')
md5sums=('cf2ddaa83059c5f135b0ee9463520b88')
sha512sums=('7a3436adbe6e5365ec2810ebf3c64d22ae707cedbfccf02f562d253c7727c33f9ea36a47a7acdba12bbf32693b4c70913a0c551b5605388fb39fa379d099af8d')
_distdir="MARC-Record-2.0.6"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod -o -name Tutorial.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
