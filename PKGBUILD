# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-exporter-declare'
pkgver='0.113'
pkgrel='1'
pkgdesc="Exporting done right"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.0' 'perl-aliased' 'perl-fennec-lite>=0.004' 'perl-meta-builder>=0.003')
makedepends=('perl-test-exception>=0.29')
url='http://search.cpan.org/dist/Exporter-Declare'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Exporter-Declare-0.113.tar.gz')
md5sums=('d5b93324f1513b3528785b2d1891425c')
sha512sums=('315234189def9202a015a7f1adb91104db4ec449443b00e612bc818531df6887207c241986100cf4d121f3281ae9f0d31b8bb62f164e5d18de7ca6ae73012f81')
_distdir="Exporter-Declare-0.113"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
