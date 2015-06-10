# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-x11-freedesktop-desktopentry
_cpanname=X11-FreeDesktop-DesktopEntry
pkgver=0.04
pkgrel=1
pkgdesc="CPAN/X11::FreeDesktop::DesktopEntry -- interface to .desktop files"
arch=('any')
url="https://metacpan.org/module/X11::FreeDesktop::DesktopEntry"
license=('GPL')
depends=()
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/G/GB/GBROWN/$_cpanname-$pkgver.tar.gz")
md5sums=('b0b70924cacf82bbf7c7c2783374b927')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_cpanname-$pkgver"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
