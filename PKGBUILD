# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-component-instancepercontext'
pkgver='0.001001'
pkgrel='1'
pkgdesc="Moose role to create only one instance of component per context"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-moose')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Component-InstancePerContext'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRODITI/Catalyst-Component-InstancePerContext-0.001001.tar.gz')
md5sums=('dd3e9c804cb7f8d6755132d92b26a80a')
sha512sums=('548c1fad4f125263776d773b2c8b337ac619e6f04c7cbe0d4bb62de3f8845c07d0207b289aecd28de564bc9ad759163b7dac8b5254aff0dc5910cd6b4d71bdf7')
_distdir="Catalyst-Component-InstancePerContext-0.001001"

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
