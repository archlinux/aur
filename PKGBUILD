# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-vim-x'
pkgver='1.2.0'
pkgrel='1'
pkgdesc="Candy for Perl programming in Vim"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo' 'perl-path-tiny' 'perl-sub-attribute' 'vim')
makedepends=()
url='https://metacpan.org/release/Vim-X'
source=('http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/Vim-X-1.2.0.tar.gz')
md5sums=('23cd21def2deef9ae3ae81807bdd784f')
sha512sums=('f0ccfd40bfef96a63f7eea2b6345b0badabd582594ead918215f5b96bad879796bd62f93994c1954062cdf7f8b2ed8e6473d1620481a3042660efddb721a1dd7')
_distdir="Vim-X-1.2.0"

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
