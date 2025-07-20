# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-date-simple'
pkgver='3.03'
pkgrel='15'
pkgdesc="a simple date object"
arch=('aarch64'
      'x86_64')
license=('Artistic-1.0-Perl'
         'GPL-3.0-or-later')
options=('!emptydirs')
depends=('perl>=0')
url='https://metacpan.org/release/Date-Simple'
source=('https://search.cpan.org/CPAN/authors/id/I/IZ/IZUT/Date-Simple-3.03.tar.gz')
sha512sums=('3e64a0ba224427e688a45945860fd5e876e6ca5b01298e744e257981ed84d933ab14c9ab8d5b74316c031ffa9821afd9563270109cba20a5939f14af2dde8668')
_distdir="Date-Simple-3.03"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
      PERL_AUTOINSTALL=--skipdeps \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_distdir}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_distdir}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_distdir}"
  make install
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
