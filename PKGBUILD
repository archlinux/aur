# CPAN Name  : Shell::Command
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-shell-command
pkgver=0.06
pkgrel=2
pkgdesc="Perl module providing cross-platform functions emulating common shell commands"
arch=("any")
url="https://metacpan.org/release/Shell-Command"
license=("PerlArtistic" "GPL")
depends=("perl")
source=(http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Shell-Command-0.06.tar.gz)
options=(!emptydirs)
md5sums=("d3e42d3cb2ea325dc1059bb8706b47bb")

build() {
  cd "$srcdir/Shell-Command-0.06"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Shell-Command-0.06"
  make test
}

package() {
  cd "$srcdir/Shell-Command-0.06"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
