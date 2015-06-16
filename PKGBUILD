# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-inline-asm'
pkgver='0.03'
pkgrel='1'
pkgdesc="Write Perl Subroutines in assembler."
arch=('x86_64' 'i686')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-inline>=0.42' 'binutils' 'gcc')
makedepends=()
optdepends=('nasm: NASM Support')
url='http://search.cpan.org/dist/Inline-ASM'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILW/Inline-ASM-0.03.tar.gz')
md5sums=('af0241d8d9993598fc146eab4be247b2')
sha512sums=('6df41b742c834403b30515f83a29b26f0658929375c59a496c6cd2c69e226c389f3e5de019d6c2be926843412e4321eff75bd91bd31bd81d76f50c588074ac3c')
_distdir="Inline-ASM-0.03"

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
