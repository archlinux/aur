# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-git-repository'
pkgver='1.318'
pkgrel='1'
pkgdesc="Perl interface to Git repositories"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-git-version-compare>=1.001' 'perl-system-command>=1.103' 'perl-namespace-clean' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Git-Repository'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOOK/Git-Repository-1.318.tar.gz')
md5sums=('ce1ac533dcfed76050c97cf2bef6d79b')
sha512sums=('3e70b22ed25942abea8a6b42583ebd59a041db538e70d2d21f7b4a6a5e4d664898c7bf0095b160d43578e7be0812d871d2a104c3f629dfdc40a08b195bbe8836')
_distdir="Git-Repository-1.318"

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
