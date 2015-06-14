# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 24/10/2011

_author=B/BZ/BZAJAC
_perlmod=Proc-Background
pkgname=perl-proc-background
pkgver=1.10
pkgrel=3
pkgdesc="Proc::Background - generic interface to Unix and Win32 background process management"
arch=('any')
url="http://search.cpan.org/dist/Proc-Background/"
license=('GPL' 'PerlArtistic')
depends=('perl')
provides=(
  'perl-proc-background-unix'
  'perl-proc-background-win32'
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")

build(){
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
#check(){
#  cd "$srcdir/$_perlmod-$pkgver"
#  make test
#}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
md5sums=('4f9d850e31c4131d1a28ffe0d26ef4e2')
