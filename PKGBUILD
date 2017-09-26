# Contributor: C. Dominik Bódi <domimik dot bodi at gmx dot de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-bareword-filehandles'
pkgver='0.005'
pkgrel='1'
pkgdesc="disables bareword filehandles"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-op-check>=0' 'perl-lexical-sealrequirehints>=0' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/bareword-filehandles'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/bareword-filehandles-0.005.tar.gz')
md5sums=('274a7aabfab579b1f1c52775b9113325')
sha512sums=('ea1117a31ad9d8d58aa0c17dd6d327ccc82f3ddc8e6c3649a1b35c9e623a39fb851b94a69c855a400d1e678d1a18da1143678efc16ccd78b151b10a2ec5a8a02')
_distdir="bareword-filehandles-0.005"

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
