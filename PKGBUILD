# Maintainer: Maxim Polishchuck <mpolishchuck@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-carton'
pkgver='1.0.22'
pkgrel='1'
pkgdesc="Perl module dependency manager (aka Bundler for Perl)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
    'cpanminus>=1.703'
    'perl-class-tiny>=1.001'
    'perl-json>=2.53'
    'perl-module-cpanfile>=0.9031'
    'perl-module-reader>=0.002'
    'perl-path-tiny>=0.033'
    'perl-try-tiny>=0.09'
    'perl>=5.8.5'
)
makedepends=()
url='https://metacpan.org/release/Carton'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Carton-v1.0.22.tar.gz')
md5sums=('a95ac3c306657449bdd6dbfb6f14d63e')
sha512sums=('a46a5159a38d81151078da5fe56c3ee8f50d34eca3bb3d74b1026f575ddd6c0cbeea1d1e42c3dabb27aebb1e84ff8311fb070f888d241e23353793f2993da2a4')
_distdir="Carton-v1.0.22"

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
