# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-software-license-gpl3andartistic2'
pkgver='0.07'
pkgrel='1'
pkgdesc="GPL 3 and Artistic 2.0 Dual License"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-software-license')
makedepends=('perl>=5.004')
url='http://search.cpan.org/dist/Software-License-GPL3andArtistic2'
source=('http://search.cpan.org/CPAN/authors/id/X/XE/XENO/Software-License-GPL3andArtistic2-0.07.tar.gz')
md5sums=('8a33850c4f8606726ef8dac23b4dea8d')
sha512sums=('766345679186150088121b1813afbeb545122024496d816f504c3dea9f3b46b8ac61f1cd2bc92a0d5c1e20ef234e317860d0e3cbe00847917ea75ff72ee1fd79')
_distdir="Software-License-GPL3andArtistic2-0.07"

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
