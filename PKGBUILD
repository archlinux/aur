# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-clone'
pkgver='0.06'
pkgrel='1'
pkgdesc="Fine-grained cloning support for Moose objects."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-visitor>=0.24' 'perl-hash-util-fieldhash-compat' 'perl-moose' 'perl-namespace-autoclean' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooseX-Clone'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Clone-0.06.tar.gz')
md5sums=('65ca9d5a0f1770d5719d1b3f90a2affb')
sha512sums=('c274e5e6e85b4a8f71aed6470ccfbba85d95e21af2a06622c2571d6ee7877a8800afbe31bd4cdad7ab89d6f4182f4799a262db64c6967f1ea0a1c6c8ac988d63')
_distdir="MooseX-Clone-0.06"

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
