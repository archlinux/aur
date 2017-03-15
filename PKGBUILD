# Maintainer: Jose Riha <jose1711 gmail com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-projectbuilder'
pkgver='0.14.1'
pkgrel='1'
pkgdesc="module dealing with generic functions suitable for perl project development"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/release/ProjectBuilder'
source=('http://search.cpan.org/CPAN/authors/id/B/BC/BCO/ProjectBuilder-0.14.1.tar.gz')
md5sums=('856897ec20375467ac23cb0ce27c833c')
sha512sums=('c007ecd8eedf3a9d7d08bd84137c25b3095b6995e654d8e8beacc5639ab118645b93bffe4978c365a43ef5f3738c4c62e5ce25a905f8fa2a4c5fe671611a87f5')
_distdir="ProjectBuilder-0.14.1"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      mandir=/usr/share/man \
      etcdir=/etc/pb \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL CONFDIR=/etc MANDIR=/usr/share/man
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
