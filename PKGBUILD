# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-file-touch'
pkgver='0.09'
pkgrel='1'
pkgdesc="update file access and modification times, optionally creating files if needed"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.mcpan.org/dist/File-Touch'
source=('http://search.mcpan.org/CPAN/authors/id/N/NE/NEILB/File-Touch-0.09.tar.gz')
md5sums=('250dd8951c9a9e6cfccddad04d8096b9')
sha512sums=('f2bd4e53ff1b57d9295e08a6445406bde1cd9e10860450612086c20177542ec3e954043be405e262ea39f331d6b51b3ea21ce3183e8538c046d5799af106d053')
_distdir="File-Touch-0.09"

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
