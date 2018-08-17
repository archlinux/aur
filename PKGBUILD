# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-file-sharedir-projectdistdir'
pkgver='1.000009'
pkgrel='1'
pkgdesc="Simple set-and-forget using of a '/share' directory in your projects root"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny' 'perl-file-sharedir' 'perl-path-finddev' 'perl-path-isdev' 'perl-path-tiny' 'perl-sub-exporter' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/File-ShareDir-ProjectDistDir'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/File-ShareDir-ProjectDistDir-1.000009.tar.gz')
md5sums=('734675bed642c515fa42296415cb98bf')
sha512sums=('23bbb04aaadfc7ac538f635fce73c1b16398105821f2d5b3ec415092ac8b26cef25dd537af9b0454313a7c147fbb11f4510add9cbd32925e02a30f71ca7c9676')
_distdir="File-ShareDir-ProjectDistDir-1.000009"

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
