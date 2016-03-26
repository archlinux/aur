# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-convert-bencode-xs'
pkgver='0.06'
pkgrel='1'
pkgdesc="Faster conversions to/from Bencode format"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Convert-Bencode_XS'
source=('http://search.cpan.org/CPAN/authors/id/I/IW/IWADE/Convert-Bencode_XS-0.06.tar.gz')
md5sums=('472a1081a20b0d42175e103c7c84b0ef')
sha512sums=('0f7a0afa3e5a270b982852903d5809c7964c174886cb99fa5a3e5e1e62a10ba9f68791c2a7d31b1f56ecbcac307b949dfc4660c613510d06a99f56dffd33adde')
_distdir="Convert-Bencode_XS-0.06"

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
