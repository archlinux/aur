# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname="perl-sys-mmap"
pkgver=0.21
pkgrel=1
pkgdesc="Use mmap to map in a file as a Perl variable"
url="https://metacpan.org/release/Sys-Mmap"
license=("PerlArtistic" "GPL")
arch=("any")
depends=("perl")
source=("https://cpan.metacpan.org/authors/id/T/TO/TODDR/Sys-Mmap-$pkgver.tar.gz")
sha256sums=('fdec18081928b0b3ff688ec8b5d2d9bd1ffc81c2c3eb1fb3c1c56aac48a96f4c')
options=("!emptydirs")

build(){
 cd "Sys-Mmap-$pkgver"
 export                                                 \
 PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
 PERL_AUTOINSTALL=--skipdeps                            \
 PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR=$pkgdir"     \
 PERL_MB_OPT="--installdirs vendor --destdir $pkgdir" \
 MODULEBUILDRC=/dev/null
 perl Makefile.PL
 make
}

check(){
 cd "Sys-Mmap-$pkgver"
 export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
 make test
}

package(){
 cd "Sys-Mmap-$pkgver"
 make install
 find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
