_author=N/NE/NERDVANA
_perlmod=Proc-Background
pkgname=perl-proc-background
pkgver=1.32
pkgrel=1
pkgdesc="Proc::Background - generic interface to Unix and Win32 background process management"
arch=('any')
url="https://metacpan.org/release/Proc-Background/"
license=('GPL' 'PerlArtistic')
depends=('perl')
provides=(
  'perl-proc-background-unix'
  'perl-proc-background-win32'
)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('5b1a780ddb929ca42725eb90b518321425ff778b4a137f86fac95d9fb9cd2967')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null


build(){
    cd "$srcdir/$_perlmod-$pkgver"
    perl Makefile.PL
    make
}
check(){
    cd "$srcdir/$_perlmod-$pkgver"
    make test
}
package(){
    cd "$srcdir/$_perlmod-$pkgver"
    make install DESTDIR="$pkgdir/"
}
