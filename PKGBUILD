# CPAN Name  : Data-UUID
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-data-uuid'
pkgver='1.221'
pkgrel='1'
pkgdesc="Globally/Universally Unique Identifiers (GUIDs/UUIDs)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Data-UUID'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Data-UUID-1.221.tar.gz')
md5sums=('7619929e8fe205a7fb83bc1c29ecbf99')
sha512sums=('fa40219890f9adeb486a7ff636603d8695d81765ee858e396130100aaba96b524d80eef76e0c06eac2086fe3bb2d26114d94459466d29ddc82a7a7fcb2f5adac')
_distdir="Data-UUID-1.221"

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
