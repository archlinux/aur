# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-template-magic'
pkgver='1.4'
pkgrel='1'
pkgdesc="Magic merger of runtime values with templates"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-util>=1.46' 'perl-ootools')
makedepends=()
url='http://search.cpan.org/dist/Template-Magic'
source=('http://search.cpan.org/CPAN/authors/id/S/SK/SKNPP/Template-Magic-1.4.tar.gz')
md5sums=('45eb67551fcf4254b22f0ac38084cffd')
sha512sums=('3d2efacdc2538f5120b15d1431498a74284c53cd74254417952bea56f477d55f147a0fbaf3f6e88028c8f97f1277655ca76f32f78463870cc39e449c0643bdcd')
_distdir="Template-Magic-1.4"

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
