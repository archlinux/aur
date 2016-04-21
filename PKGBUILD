# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojox-directorylisting'
pkgver='0.05'
pkgrel='1'
pkgdesc="show Apache-style directory listings in your Mojolicious app"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious')
makedepends=()
url='https://metacpan.org/release/MojoX-DirectoryListing'
source=('http://search.cpan.org/CPAN/authors/id/M/MO/MOB/MojoX-DirectoryListing-0.05.tar.gz')
md5sums=('b39fd73f0cd8ead9a0f95ce79e7b6c32')
sha512sums=('0bf8cbd14ac8d70e04de4beac0769ab24b52554a41ad9463d052387d3effa074808ac4c1b366983bb89dbcd24ef91288c4c2b1e7b48ddeec27a97f3e7ed2659b')
_distdir="MojoX-DirectoryListing-0.05"

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
