# Contributor: Simon Perry <pezz [at] sanxion [dot] net>

pkgname=perl-x11-wmctrl
_relpkg=X11-WMCtrl
pkgver=0.03
pkgrel=3
pkgdesc="Perl wrapper for the wmctrl program"
depends=('perl' 'wmctrl')
license=('GPL' 'PerlArtistic')
url="https://metacpan.org/pod/X11::WMCtrl"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/G/GB/GBROWN/$_relpkg-$pkgver.tar.gz")
options=('!emptydirs')
arch=(any)
sha256sums=('d71f935adcea0580fc6a74f35294fab547774cc7ceb0906365856ddb034f82a9')

build()
{
  cd "$srcdir/$_relpkg-$pkgver"

  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package()
{
  cd "$srcdir/$_relpkg-$pkgver"
  make DESTDIR=${pkgdir} install
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}
# vim: ts=2 sw=2 et:
