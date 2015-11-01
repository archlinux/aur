# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-symbol-util'
pkgver='0.0203'
pkgrel='1'
pkgdesc="Additional utils for Perl symbols manipulation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Symbol-Util'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DEXTER/Symbol-Util-0.0203.tar.gz')
md5sums=('e32e67236e68281184e8017aa6158ffd')
sha512sums=('380dfec5009ae6e6d6df8981a2314f56be049039c33d86d03262ca30c4de54930e0e6dd38c83c40c4edc5c548e0ea8bd0a5b734a295b8925ad264cffbc19296d')
_distdir="Symbol-Util-0.0203"

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
