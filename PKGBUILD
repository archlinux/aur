# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-digest-jhash'
pkgver='0.09'
pkgrel='1'
pkgdesc="Perl extension for 32 bit Jenkins Hashing Algorithm"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Digest-JHash'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Digest-JHash-0.09.tar.gz')
md5sums=('2f89a3ee5709181b87110545fa694254')
sha512sums=('2490abd0bbd2a83e6eb2aa1a856e428ae945b103c1b05959f0fd5e13db4999123dd5222b04aaa1efd846b5f6c7c9865154ec8fb0e4e7ea526d8f126e6963d921')
_distdir="Digest-JHash-0.09"

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
