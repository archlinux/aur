# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-unload'
pkgver='0.12'
pkgrel='1'
pkgdesc="Perl/CPAN Module Class::Unload: Unload a class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-inspector')
makedepends=()
checkdepends=('perl-test-requires')
url='https://metacpan.org/release/Class-Unload'
source=("http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/Class-Unload-$pkgver.tar.gz")
md5sums=('a1fb61fb984184d4a939e33f6973a7af')
sha512sums=('53c0636e7b6f211288edcdba77721ab2e7015df183f85d524c8980638d641f2db29f72ae08e1b76313aaf1aecef35d1e4319fd13a893ef12356f0f61d8d599c9')
_distdir="Class-Unload-$pkgver"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
