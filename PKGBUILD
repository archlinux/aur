# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-poe-component-pluggable
pkgver=1.26
pkgrel=2
pkgdesc="A base class for creating plugin enabled POE Components"
depends=('perl>=5.10.0' 'glibc' 'perl-poe')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/POE-Component-Pluggable"
source=(http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/POE-Component-Pluggable-$pkgver.tar.gz)
md5sums=('989a64c6c2939a19ee5844c9d9e87047')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/POE-Component-Pluggable-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

