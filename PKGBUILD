# CPAN Name  : Test::Script::Run
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.13

pkgname=perl-test-script-run
pkgver=0.05
pkgrel=1
pkgdesc="Perl module helping with scripts testing in your module"
arch=("any")
url="http://search.cpan.org/dist/Test-Script-Run"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-ipc-run3" "perl-test-exception")
source=(http://search.cpan.org/CPAN/authors/id/S/SU/SUNNAVY/Test-Script-Run-0.05.tar.gz)
options=(!emptydirs)
md5sums=("7d8f07c00349eafe0292941e514a6b36")

build() {
  cd "$srcdir/Test-Script-Run-0.05"
  PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Test-Script-Run-0.05"
  make test
}

package() {
  cd "$srcdir/Test-Script-Run-0.05"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
