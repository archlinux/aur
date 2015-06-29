# CPAN Name  : Dancer
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-dancer'
pkgver='1.3138'
pkgrel='1'
pkgdesc="A minimal-effort oriented web application framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-runtime' 'perl-http-body>=1.07' 'perl-http-server-simple-psgi>=0.11' 'perl-libwww' 'perl-mime-types' 'perl-try-tiny>=0.09' 'perl-uri>=1.59' 'perl-xml-libxml')
makedepends=()
optdepends=('perl-yaml: YAML configuration files'
  'perl-template-toolkit: Template Toolkit rendering')
url='http://search.cpan.org/dist/Dancer'
source="http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/Dancer-${pkgver}.tar.gz"
md5sums=('e6a479822947193443c5be0f4314563a')
_distdir="Dancer-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
