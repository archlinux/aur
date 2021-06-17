# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname="perl-sys-mmap"
pkgver=0.20
pkgrel=1
pkgdesc="Use mmap to map in a file as a Perl variable"
url="https://metacpan.org/release/Sys-Mmap"
license=("PerlArtistic" "GPL")
arch=("any")
depends=("perl")
source=("https://cpan.metacpan.org/authors/id/T/TO/TODDR/Sys-Mmap-$pkgver.tar.gz")
sha256sums=("1820ce2c89f1ab7357644f8db0f49f142f54526250fb1e235db10aa80f15e2cf")
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
