# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-marc-xml'
pkgver='1.0.3'
pkgrel='1'
pkgdesc="Perl/CPAN Module MARC::XML: Convert between MARC and XML."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-marc-charset>=0.98' 'perl-marc-record>=2' 'perl-xml-libxml>=1.66')
makedepends=()
url='https://metacpan.org/release/MARC-XML'
source=('http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-XML-1.0.3.tar.gz')
md5sums=('fe536ab036e7267d152d4daaf7ef8c9f')
sha512sums=('a460388c92ac8c6c285b40d1ec2cfc4d86177c9a35854a8da17ac16349f952af37f57e00fce4091546f8225757addd1ee4c16862334c6d59b712395b284661a9')
_distdir="MARC-XML-1.0.3"

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
