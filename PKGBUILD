# Contributor: Christian Sturm <reezer@reezer.org>
pkgname=perl-modern-perl
pkgver=1.20150127
pkgrel=1
pkgdesc="enable all of the features of Modern Perl with one command"
arch=(any)
url="https://metacpan.org/release/Modern-Perl"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://cpan.metacpan.org/authors/id/C/CH/CHROMATIC/Modern-Perl-$pkgver.tar.gz)
md5sums=('afa60a8d4ca5773db717e5f3ed0d5755')

build() {
  cd "$srcdir/Modern-Perl-$pkgver"

  # for packages with Build.PL, do this instead:
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/Modern-Perl-$pkgver"

  perl Build install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
