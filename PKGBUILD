# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-vim-x'
pkgver='1.3.0'
pkgrel='1'
pkgdesc="Candy for Perl programming in Vim"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('vim' 'perl-moo' 'perl-path-tiny' 'perl-sub-attribute' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Vim-X'
source=('http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/Vim-X-1.3.0.tar.gz')
md5sums=('24e5c5d30a37426878d7649de9d492f5')
sha512sums=('539a4105d533b79f3068682ee91bee0d8763c9d42e03c82a8dfb662dbf90e6e36de267e663415a1a3b431f2243530b65a4d8bff7a5bc8fb316da915fcb505093')
_distdir="Vim-X-1.3.0"

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
